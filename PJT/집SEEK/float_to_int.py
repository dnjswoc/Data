import pandas as pd

df = pd.read_csv("seoul_dong_centroids_with_dongId.csv", encoding="utf-8")

df["dongId"] = pd.to_numeric(df["dongId"], errors="coerce").fillna(0).astype(int)

print(df.head())
print(df.info())

# 📌 8️⃣ 최종 CSV 저장
output_csv_path = "seoul_dong_centroids_dongid.csv"
df.to_csv(output_csv_path, index=False, encoding="utf-8-sig")

print(f"✅ CSV 파일 저장 완료: {output_csv_path}")