import pandas as pd

file_path = "서울특별시_행정동_이름수정.csv"  # 실제 파일 경로로 변경
df = pd.read_csv(file_path, encoding="utf-8-sig")

print(df.head())
print(df.info())