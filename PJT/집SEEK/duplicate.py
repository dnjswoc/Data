import pandas as pd

# 1️⃣ CSV 파일 불러오기
file_path = "./seoul_data/여가점수.csv"
df = pd.read_csv(file_path, encoding="utf-8-sig")

# 2️⃣ 위도와 경도가 같은 행이 여러 개 있을 경우, 첫 번째 하나만 남기기
df_deduplicated = df.drop_duplicates(subset=['latitude', 'longitude'], keep='first')

# 3️⃣ 결과 저장
output_path = "./seoul_data/여가점수_중복제거.csv"
df_deduplicated.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 위도·경도 중복 제거 완료! 저장된 파일: {output_path}")
