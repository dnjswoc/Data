import pandas as pd
import re
import requests
import os
from dotenv import load_dotenv
from concurrent.futures import ProcessPoolExecutor, as_completed

# Kakao REST API 키
load_dotenv()
KAKAO_REST_API_KEY = os.getenv("KAKAO_API_KEY")

##############################
# 1) 주소 -> 위/경도 변환 함수
##############################
def get_lat_lon(address: str):
    """
    주어진 주소를 바탕으로 Kakao API를 호출하여 위도(latitude)와 경도(longitude)를 반환.
    반환값: (latitude, longitude) 또는 (None, None) if not found.
    """
    url = "https://dapi.kakao.com/v2/local/search/address.json"
    headers = {"Authorization": f"KakaoAK {KAKAO_REST_API_KEY}"}
    params = {"query": address}
    try:
        response = requests.get(url, headers=headers, params=params, timeout=5)
        if response.status_code == 200:
            data = response.json()
            documents = data.get('documents', [])
            if documents:
                addr_info = documents[0].get('address')
                if addr_info and 'x' in addr_info and 'y' in addr_info:
                    lon = float(addr_info['x'])  # 경도
                    lat = float(addr_info['y'])  # 위도
                    print(f"[LOG] {address} -> lat: {lat}, lon: {lon}")
                    return lat, lon
        print(f"[LOG] {address} -> 조회 결과 없음.")
        return None, None
    except Exception as e:
        print(f"[ERROR] {address} 처리 에러: {e}")
        return None, None

##############################
# 2) 구/동 추출 함수
##############################
def extract_gu(address: str):
    """
    예: '서울특별시 광진구 구의동 212-3'에서 '광진구' 추출
    """
    match = re.search(r'(\S+구)', address)
    if match:
        return re.sub(r'[()]', '', match.group(1))
    return None

def extract_dong(address: str):
    """
    예: '서울특별시 광진구 구의동 212-3'에서 '구의동' 추출
    """
    match = re.search(r'(\S+동)', address)
    if match:
        return re.sub(r'[()]', '', match.group(1))
    return None

##############################
# 3) 각 파일 처리 함수
##############################
def process_file(file_path: str) -> pd.DataFrame:
    """
    주어진 CSV 파일을 읽어, Kakao API로 위/경도 조회 후
    name, gu_name, dong_name, latitude, longitude 컬럼을 갖는 DataFrame을 반환.
    """
    # CSV 읽기
    try:
        df = pd.read_csv(file_path, encoding='utf-8-sig')
    except UnicodeDecodeError:
        # utf-8-sig 실패 시 cp949 시도 (파일 인코딩이 다를 수 있으므로)
        df = pd.read_csv(file_path, encoding='cp949')

    # 파일에 따라 컬럼명이 다를 수 있으나, 여기서는
    # name, phone, address, url 네 컬럼이 있다고 가정
    required_cols = ['name', 'phone', 'address', 'url']
    for col in required_cols:
        if col not in df.columns:
            raise ValueError(f"{file_path}에 '{col}' 컬럼이 없습니다.")

    # Kakao API로 위/경도 조회
    # address 컬럼 사용
    lat_list = []
    lon_list = []
    for idx, row in df.iterrows():
        address = str(row['address'])
        name = str(row['name'])
        lat, lon = get_lat_lon(address)
        lat_list.append(lat)
        lon_list.append(lon)

    # 결과 병합
    df['latitude'] = lat_list
    df['longitude'] = lon_list

    # 좌표가 None 인 행은 제거
    df = df.dropna(subset=['latitude', 'longitude'])

    # 구/동 추출
    df['gu_name'] = df['address'].apply(extract_gu)
    df['dong_name'] = df['address'].apply(extract_dong)

    # 최종 컬럼만 남김
    final_cols = ['name', 'gu_name', 'dong_name', 'latitude', 'longitude']
    df_final = df[final_cols].copy()

    return df_final

##############################
# 4) 메인 처리 로직
##############################
if __name__ == "__main__":
    # 처리할 CSV 파일들
    files = [
        'bbq.csv',
        'bhc.csv',
        'kyochon.csv',
        'nene.csv'
    ]

    # 병렬 처리 (ProcessPoolExecutor)
    results = []
    with ProcessPoolExecutor() as executor:
        future_to_file = {executor.submit(process_file, f): f for f in files}
        for future in as_completed(future_to_file):
            file_name = future_to_file[future]
            try:
                data = future.result()  # DataFrame
                results.append(data)
                print(f"[INFO] {file_name} 처리 완료, shape={data.shape}")
            except Exception as e:
                print(f"[ERROR] {file_name} 처리 중 에러 발생: {e}")

    # 모든 파일의 결과를 하나로 합침
    if results:
        df_all = pd.concat(results, ignore_index=True)
        # 치킨2.csv 로 저장
        df_all.to_csv('치킨2.csv', index=False, encoding='utf-8-sig')
        print(f"[INFO] 전체 병합 완료, 최종 shape={df_all.shape}, 치킨2.csv 저장 완료!")
    else:
        print("[INFO] 처리 결과가 없습니다.")
