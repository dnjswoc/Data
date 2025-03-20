import pandas as pd

# 파일 경로 설정
file1 = "convenience_coinwashwer_converted_with_gu_dong.csv"
file2 = "convenience_daiso_processed.csv"
file3 = "편의점.csv"

selected_columns = ['name', 'type', 'gu_name', 'dong_name', 'latitude', 'longitude']

# CSV 파일 불러오기
df1 = pd.read_csv(file1, encoding="utf-8-sig")[selected_columns]
df2 = pd.read_csv(file2, encoding="utf-8-sig")[selected_columns]
df3 = pd.read_csv(file3, encoding="utf-8-sig")[selected_columns]


# 두 데이터프레임 합치기 (단순 세로 병합)
merged_df = pd.concat([df1, df2, df3], ignore_index=True)


# 합친 파일 저장
output_path = "convenience.csv"
merged_df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 CSV 파일 합치기 완료! 저장된 파일: {output_path}")
