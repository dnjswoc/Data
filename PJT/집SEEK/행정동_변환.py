import pandas as pd
import requests
import os
import time
from dotenv import load_dotenv

# .env 파일 로드 (카카오 API 키 관리)
load_dotenv()
KAKAO_API_KEY = os.getenv("KAKAO_API_KEY")

# 행정동 가져오기 함수
def get_admin_dong_from_coordinates(lat, lng, index, total_rows):
    url = f"https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x={lng}&y={lat}"
    headers = {"Authorization": f"KakaoAK {KAKAO_API_KEY}"}
    
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        result = response.json()
        if result['documents']:
            for doc in result['documents']:
                if doc['region_type'] == 'H':  # 'H'가 행정동
                    print(f"✅ [{index}/{total_rows}] 변환 성공: 위도 {lat}, 경도 {lng} → 행정동: {doc['region_3depth_name']}")
                    return doc['region_3depth_name']
    
    print(f"⚠️ [{index}/{total_rows}] 변환 실패: 위도 {lat}, 경도 {lng}")
    return None  # 실패 시 None 반환

# 1️⃣ CSV 파일 로드
file_path = "./property_data/convenience_stores.csv"  # 실제 파일 경로로 변경
df = pd.read_csv(file_path, encoding="utf-8-sig")

# 전체 행 개수 확인
total_rows = len(df)


# 2️⃣ 위도, 경도에서 행정동 가져오기 (API 호출, 진행 상황 표시)
df['dong_name'] = df.apply(lambda row: get_admin_dong_from_coordinates(row['latitude'], row['longitude'], row.name + 1, total_rows), axis=1)


# 3️⃣ 정리된 데이터 저장
output_path = "./property_data/converted/편의점.csv"
df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 행정동 정보 추가 완료! 저장된 파일: {output_path}")