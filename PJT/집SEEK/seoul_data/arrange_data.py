import pandas as pd
import re

# CSV 파일 로드
file_path = "여가점수.csv"
df = pd.read_csv(file_path, encoding='utf-8-sig')

# 1️⃣ 결측치(빈 값) 제거
df = df.dropna(subset=['latitude', 'longitude'])

# 2️⃣ 건물명 정리: '관', '호', '지점' 등의 상세 정보를 제거
def clean_building_name(name):
    # 정규 표현식을 사용하여 '관', '호', '지점' 등의 뒤쪽 상세 정보를 제거
    return re.sub(r"\s*\d?[관호지점]+\s*", "", name).strip()

df['cleaned_name'] = df['name'].apply(clean_building_name)

# 3️⃣ 위도, 경도가 같은 경우 첫 번째 행만 유지
df_sorted = df.sort_values(by=['latitude', 'longitude'])  # 정렬
df_deduplicated = df_sorted.drop_duplicates(subset=['latitude', 'longitude'], keep='first')

# 4️⃣ 컬럼 정리 (불필요한 칼럼 제거)
df_deduplicated = df_deduplicated[['cleaned_name', 'gu_name', 'dong_name', 'latitude', 'longitude']]
df_deduplicated.rename(columns={'cleaned_name': 'name'}, inplace=True)

# 5️⃣ 최종 CSV 파일 저장
output_path = "cleaned_data_unique.csv"
df_deduplicated.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 데이터 정리 완료! 저장된 파일: {output_path}")
