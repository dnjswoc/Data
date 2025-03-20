import pandas as pd

# 1️⃣ CSV 파일 불러오기
file_path = "./property_data/converted/transport.csv"
df = pd.read_csv(file_path, encoding="utf-8-sig")

# 2️⃣ dong_name에서 '.'을 '·'로 변경
df["dong_name"] = df["dong_name"].str.replace(".", "·", regex=False)

# 3️⃣ 수정된 CSV 파일 저장
output_path = "./property_data/converted/transport_updated.csv"
df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 dong_name에서 '.'을 '·'로 변경 완료! 저장된 파일: {output_path}")
