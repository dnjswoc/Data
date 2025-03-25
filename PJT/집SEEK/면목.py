import pandas as pd
import re

# CSV 파일 불러오기
file_path = "./seoul_data/museum_dong.csv"
df = pd.read_csv(file_path, encoding="utf-8-sig")

# dong_name에서 1.2.3 형태를 1·2·3 형태로 변환하는 함수
def replace_dot_with_middle_dot(dong_name):
    if pd.isna(dong_name):
        return dong_name
    # 숫자 사이에 있는 점(.)을 가운데 점(·)으로 치환
    return re.sub(r'(?<=\d)\.(?=\d)', '·', dong_name)

# 적용
df['dong_name'] = df['dong_name'].apply(replace_dot_with_middle_dot)

# 저장
output_path = "./seoul_data/museum.csv"
df.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 dong_name 중 '.' → '·' 변환 완료! 저장된 파일: {output_path}")
