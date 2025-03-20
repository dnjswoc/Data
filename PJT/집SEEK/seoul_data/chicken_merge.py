import pandas as pd

# 파일 경로 설정
file1 = "cleaned_chicken_data.csv"
file2 = "치킨_result.csv"

# CSV 파일 불러오기
df1 = pd.read_csv(file1, encoding="utf-8-sig")
df2 = pd.read_csv(file2, encoding="utf-8-sig")

# 두 데이터프레임 합치기 (단순 세로 병합)
merged_df = pd.concat([df1, df2], ignore_index=True)


# 합친 파일 저장
output_path = "merged_chicken_data.csv"
merged_df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 CSV 파일 합치기 완료! 저장된 파일: {output_path}")
