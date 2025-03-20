import pandas as pd
import os

# 📌 1️⃣ 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_데이터_업데이트.csv"  # 기존 데이터
df_data = pd.read_csv(data_file, encoding="utf-8-sig")


# 서울특별시 행정동별 면적 데이터 불러오기
seoul_area = "seoul_area.csv"
df_area = pd.read_csv(seoul_area, usecols=[1, 2, 3], encoding="utf-8-sig")


# 칼럼 이름 변경
df_area.columns = ["주소2", "주소3", "면적(km²)"]
df_area["주소3"] = df_area["주소3"].str.replace(".", "·")
print(df_area.head())

# 필요 없는 헤더가 있는 행 제거
df_area = df_area.iloc[2:].reset_index(drop=True)



# 인구 수 칼럼의 값을 정수형으로 변경
df_area["면적(km²)"] = pd.to_numeric(df_area["면적(km²)"], errors="coerce").fillna(0)


print(df_area.info())



# 📌 6️⃣ 행정동 데이터와 인구 데이터 병합 (법정동 기준)
df_merged = df_data.merge(df_area, on=["주소2", "주소3"], how="left")


print(df_merged.head())

# 📌 7️⃣ NaN 값 처리 (인구 데이터가 없는 경우 0으로 채움)
df_merged["면적(km²)"].fillna(0, inplace=True)

# 📌 8️⃣ 최종 CSV 저장
output_csv_path = "서울특별시_행정동별_데이터_업데이트_면적.csv"
df_merged.to_csv(output_csv_path, index=False, encoding="utf-8-sig")

print(f"✅ CSV 파일 저장 완료: {output_csv_path}")
