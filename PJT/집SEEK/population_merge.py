import pandas as pd
import os

# 📌 1️⃣ 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_데이터.csv"  # 기존 데이터
df_data = pd.read_csv(data_file, encoding="utf-8-sig")


# ✅ 서울특별시 행정동별 인구 데이터 불러오기
seoul_population = "seoul_population.csv"
df_population = pd.read_csv(seoul_population, usecols=[1, 2, 4], encoding="utf-8-sig")


# 칼럼 이름 변경
df_population.columns = ["주소2", "주소3", "인구"]
df_population["주소3"] = df_population["주소3"].str.replace(".", "·")
print(df_population.head())

# 필요 없는 헤더가 있는 행 제거
df_population = df_population.iloc[2:].reset_index(drop=True)

# 인구 수 칼럼의 값을 정수형으로 변경
df_population["인구"] = pd.to_numeric(df_population["인구"], errors="coerce").fillna(0).astype(int)

print(df_population.head())

# 📌 6️⃣ 행정동 데이터와 인구 데이터 병합 (법정동 기준)
df_merged = df_data.merge(df_population, on=["주소2", "주소3"], how="left")

print(df_merged.head())

# 📌 7️⃣ NaN 값 처리 (인구 데이터가 없는 경우 0으로 채움)
df_merged["인구"].fillna(0, inplace=True)

# 📌 8️⃣ 최종 CSV 저장
output_csv_path = "서울특별시_행정동별_데이터_업데이트.csv"
df_merged.to_csv(output_csv_path, index=False, encoding="utf-8-sig")

print(f"✅ CSV 파일 저장 완료: {output_csv_path}")
