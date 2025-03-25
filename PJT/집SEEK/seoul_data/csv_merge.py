import pandas as pd

# 1️⃣ 파일 경로 설정
file1 = "leisure.csv"
file2 = "museum.csv"

# 2️⃣ CSV 파일 읽기
df1 = pd.read_csv(file1, encoding="utf-8-sig")
df2 = pd.read_csv(file2, encoding="utf-8-sig")

# 3️⃣ 두 데이터프레임을 아래로 이어붙이기 (세로 병합)
merged_df = pd.concat([df1, df2], ignore_index=True)

# 4️⃣ 저장
output_path = "merged_leisure_museum.csv"
merged_df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 CSV 파일 병합 완료! 저장된 파일: {output_path}")
