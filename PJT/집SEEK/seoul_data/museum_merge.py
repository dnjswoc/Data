import pandas as pd
import requests
import os
import glob
import time
from dotenv import load_dotenv

# .env 파일 로드 (카카오 API 키 관리)
load_dotenv()
KAKAO_API_KEY = os.getenv("KAKAO_API_KEY")

# 카카오 API: 좌표 -> 주소 변환 함수
def get_address_from_coordinates(lat, lng):
    url = f"https://dapi.kakao.com/v2/local/geo/coord2address.json?x={lng}&y={lat}"
    headers = {"Authorization": f"KakaoAK {KAKAO_API_KEY}"}
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        result = response.json()
        if result['documents']:
            address_info = result['documents'][0]['address']
            gu_name = address_info.get('region_2depth_name', '')  # 구 이름
            dong_name = address_info.get('region_3depth_name', '')  # 동 이름
            return gu_name, dong_name
    return None, None  # 실패 시 빈 값 반환

# 1️⃣ 'name', 'gu_name', 'dong_name', 'latitude', 'longitude' 칼럼을 가진 빈 데이터프레임 생성
columns = ['name', 'gu_name', 'dong_name', 'latitude', 'longitude']
final_df = pd.DataFrame(columns=columns)

# 2️⃣ CSV 파일이 저장된 폴더 내 모든 CSV 파일 가져오기
folder_path = "./museum/"
csv_files = glob.glob(folder_path + "*.csv")  # 모든 CSV 파일 목록 가져오기

# 3️⃣ CSV 파일을 순회하면서 데이터 추가
for file in csv_files:
    print(f"📂 파일 처리 중: {file}")

    try:
        df = pd.read_csv(file, encoding='utf-8-sig')  # UTF-8로 파일 읽기
    except UnicodeDecodeError:
        df = pd.read_csv(file, encoding='cp949')  # CP949로 다시 시도

    # 필요한 컬럼이 존재하는 경우만 처리
    if {'시설명', '위도', '경도'}.issubset(df.columns):
        df = df[['시설명', '위도', '경도']].copy()
        df.columns = ['name', 'latitude', 'longitude']  # 컬럼명 변경
        
        # 4️⃣ 위도·경도가 비어있는 데이터 제거
        df = df.dropna(subset=['latitude', 'longitude'])

        # 5️⃣ 카카오 API를 사용하여 구/동 정보 추가
        df['gu_name'], df['dong_name'] = zip(*df.apply(lambda row: get_address_from_coordinates(row['latitude'], row['longitude']), axis=1))

        # 6️⃣ 기존 데이터프레임에 추가
        final_df = pd.concat([final_df, df], ignore_index=True)
    
    else:
        print(f"⚠️ [경고] {file} 파일에서 필요한 컬럼을 찾을 수 없음. 건너뜀.")

# 7️⃣ 최종 데이터 저장
output_path = "merged_museum_data.csv"
final_df.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 데이터 처리 완료! 저장된 파일: {output_path}")
