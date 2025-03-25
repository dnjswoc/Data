import pandas as pd
import os

# 📌 1️⃣ 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_선호항목_최종점수.csv"  # 기존 데이터
df_data = pd.read_csv(data_file, encoding="utf-8-sig")
print(df_data.head())


# 서울특별시 행정동별 면적 데이터 불러오기
seoul_code = "2023년6월_행정동코드_추가_수정됨.csv"
df_code = pd.read_csv(seoul_code, encoding="utf-8-sig")


# 칼럼 이름 변경
selected_columns = ["시군구명칭", "읍면동명칭", "행정동코드"]
df_code = df_code[["시군구명칭", "읍면동명칭", "행정동코드"]].rename(columns={
    "시군구명칭":"주소2",
    "읍면동명칭":"주소3",
    "행정동코드":"행정동코드"
})
# df_code["주소3"] = df_code["주소3"].str.replace(".", "·")
print(df_code.head())




# 📌 6️⃣ 행정동 데이터와 인구 데이터 병합 (행정동 기준)
df_merged = df_data.merge(df_code, on=["주소2", "주소3"], how="left")


print(df_merged.head())

# 📌 7️⃣ NaN 값 처리 (인구 데이터가 없는 경우 0으로 채움)
# df_merged["면적(km²)"].fillna(0, inplace=True)

save_columns = ["주소2", "주소3", "안전", "여가", "식당", "의료", "마트", "편의 시설", "대중교통", "행정동코드"]
final_df = df_merged[save_columns]

print(final_df.head())

# 📌 8️⃣ 최종 CSV 저장
output_csv_path = "서울특별시_행정동별_데이터_업데이트_행정동코드.csv"
final_df.to_csv(output_csv_path, index=False, encoding="utf-8-sig")

print(f"✅ CSV 파일 저장 완료: {output_csv_path}")
