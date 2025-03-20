import pandas as pd


data_file = "치킨2.csv"
df = pd.read_csv(data_file, encoding="utf-8-sig")

df = df.dropna()

output_path = "cleaned_chicken_data.csv"
df.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 데이터 정리 완료! 저장된 파일: {output_path}")
