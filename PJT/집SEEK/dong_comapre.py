import pandas as pd

# 1️⃣ CSV 파일 불러오기
file1 = "./dong_data/서울특별시_행정동별_선호항목_최종점수.csv"  # 기준 파일
file2 = "./property_data/converted/cafe.csv"  # 비교 파일

df1 = pd.read_csv(file1, encoding="utf-8-sig")
df2 = pd.read_csv(file2, encoding="utf-8-sig")

# 2️⃣ 기준 파일(df1)과 비교 파일(df2)에서 동 이름 리스트 가져오기
dong_set_1 = set(df1["주소3"].dropna().unique())  # 기준 파일의 동 이름 (주소3)
dong_set_2 = set(df2["dong_name"].dropna().unique())  # 비교 파일의 동 이름 (dong_name)

# 3️⃣ 기준 파일에는 없고 비교 파일에만 있는 동 이름 찾기
only_in_file2 = dong_set_2 - dong_set_1  # 비교 파일에만 있는 동 이름

# 4️⃣ 해당 동 이름이 포함된 행 전체 필터링
df_unmatched = df2[df2["dong_name"].isin(only_in_file2)]

# 5️⃣ 결과 CSV로 저장
output_path = "unmatched_dong_names.csv"
df_unmatched.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 기준 파일에는 없고, 비교 파일에만 있는 동 이름을 저장한 CSV 파일 생성 완료! → {output_path}")
