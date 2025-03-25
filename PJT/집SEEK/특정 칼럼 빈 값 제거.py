import pandas as pd

# CSV 불러오기 예시
df = pd.read_csv("new_off_coords_dongname.csv")

# 특정 칼럼(예: 'dong_name')의 값이 비어 있는 행 제거
df = df.dropna(subset=['latitude'])

# 저장 (선택 사항)
df.to_csv("filtered_off_coords_dongname.csv", index=False, encoding="utf-8-sig")

print("✅ 비어 있는 'dong_name' 행 제거 완료!")
