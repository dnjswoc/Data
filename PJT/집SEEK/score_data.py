import pandas as pd
import requests
import os
import time
from dotenv import load_dotenv
from tqdm import tqdm  # 진행률 표시 라이브러리

# .env 파일 로드 (Kakao API 키 관리)
load_dotenv()
KAKAO_API_KEY = os.getenv("KAKAO_API_KEY")

# TM 좌표 -> WGS84 (위도, 경도) 변환 함수
def convert_to_wgs84(x, y):
    # x, y는 TM 좌표라고 가정하고 변환 (출력: (latitude, longitude))
    url = f"https://dapi.kakao.com/v2/local/geo/transcoord.json?x={x}&y={y}&input_coord=TM&output_coord=WGS84"
    headers = {"Authorization": f"KakaoAK {KAKAO_API_KEY}"}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        result = response.json()
        if result['documents']:
            # 반환 순서: 위도, 경도
            return result['documents'][0]['y'], result['documents'][0]['x']
        
    print(f"⚠️ [좌표 변환 실패] x={x}, y={y}")  # 변환 실패 로그
    return None, None

# WGS84 좌표 (longitude, latitude)를 주소(시군구, 행정동)로 변환 함수
def get_address_from_coordinates(lng, lat):
    # Kakao API는 x=경도, y=위도 순으로 받습니다.
    url = f"https://dapi.kakao.com/v2/local/geo/coord2address.json?x={lng}&y={lat}"
    headers = {"Authorization": f"KakaoAK {KAKAO_API_KEY}"}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        result = response.json()
        if result['documents']:
            address_info = result['documents'][0]['address']
            gu_name = address_info.get('region_2depth_name', '')
            dong_name = address_info.get('region_3depth_name', '')
            return gu_name, dong_name
        
    print(f"⚠️ [주소 변환 실패] lat={lat}, lng={lng}")  # 변환 실패 로그
    return None, None

# 파일 경로 설정
files = {
    "공연장": "./seoul_data/서울시 공연장 인허가 정보.csv",
    "영화관": "./seoul_data/서울시 영화상영관 인허가 정보.csv",
    "공원":   "./seoul_data/서울시 주요 공원현황.csv"
}

# 각 파일에 대한 칼럼 매핑
# ※ 공연장, 영화관은 '사업장명', '좌표X', '좌표Y', '영업상태명' 칼럼이 있다고 가정
#   공원은 '공원명', 'X좌표', 'Y좌표' 칼럼을 사용합니다.
column_mapping = {
    "공연장": {"name": "사업장명", "x": "좌표정보(X)", "y": "좌표정보(Y)", "status": "영업상태명"},
    "영화관": {"name": "사업장명", "x": "좌표정보(X)", "y": "좌표정보(Y)", "status": "영업상태명"},
    "공원":   {"name": "공원명",    "x": "X좌표(GRS80TM)",   "y": "Y좌표(GRS80TM)",  "status": None}
}

# 최종 데이터를 담을 리스트
dataframes = []

for category, file_path in files.items():
    print(f"\n📂 [{category}] 파일 로딩 중... ({file_path})")

    # 인코딩 문제 발생 시 encoding 옵션을 조정하세요 (예: cp949, euc-kr)
    try:
        df = pd.read_csv(file_path, encoding='cp949')
    except UnicodeDecodeError:
        df = pd.read_csv(file_path, encoding='euc-kr')
    
    mapping = column_mapping[category]
    
    # 공연장, 영화관은 영업상태가 '영업'인 데이터만 선택 (공원은 상태 체크 없음)
    if mapping["status"]:
        df = df[df[mapping["status"]] == "영업/정상"]
    
    # 필요한 칼럼만 추출 및 칼럼명 통일 (name, x, y)
    df = df[[mapping["name"], mapping["x"], mapping["y"]]].copy()
    df.columns = ["name", "x", "y"]

    print(f"🔍 [데이터 로드 완료] 총 {len(df)}개 행 처리 예정...")
    
    # 좌표 변환 및 주소 조회 결과 저장할 리스트
    latitudes = []
    longitudes = []
    gu_names = []
    dong_names = []
    
    # 각 행에 대해 좌표 변환 및 주소 변환
    for idx, row in tqdm(df.iterrows(), total=len(df), desc=f"📍 {category} 데이터 변환 진행 중"):
        orig_x = row["x"]
        orig_y = row["y"]

        print(f"좌표 변환 전, x={orig_x}, y={orig_y}")
        
        # TM 좌표를 WGS84 (위도, 경도)로 변환
        lat, lng = convert_to_wgs84(orig_x, orig_y)
        # 변환에 실패하면 건너뜁니다.
        if lat is None or lng is None:
            latitudes.append(None)
            longitudes.append(None)
            gu_names.append(None)
            dong_names.append(None)
            continue

        print(f"좌표 변환 후, 경도={lng}, 위도={lat}")
        
        # Kakao API는 WGS84 좌표에서 주소를 가져옴 (x: 경도, y: 위도)
        gu, dong = get_address_from_coordinates(lng, lat)
        
        # API 호출 제한을 피하기 위해 잠시 대기 (필요시 조정)
        time.sleep(0.5)
        
        latitudes.append(lat)
        longitudes.append(lng)
        gu_names.append(gu)
        dong_names.append(dong)
    
    # 변환 결과 칼럼 추가
    df["latitude"] = latitudes
    df["longitude"] = longitudes
    df["gu_name"] = gu_names
    df["dong_name"] = dong_names
    
    # 최종 칼럼만 선택: name, gu_name, dong_name, latitude, longitude
    df = df[["name", "gu_name", "dong_name", "latitude", "longitude"]]

    print(f"✅ [{category}] 데이터 변환 완료! 변환된 행 수: {len(df)}개")
    
    dataframes.append(df)

# 모든 데이터를 하나의 데이터프레임으로 병합
final_df = pd.concat(dataframes, ignore_index=True)

# 최종 결과를 CSV 파일로 저장 (인코딩은 utf-8-sig 권장)
output_path = "./seoul_data/여가점수.csv"
final_df.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"최종 변환된 데이터가 저장되었습니다: {output_path}")
