import pandas as pd
import re

# CSV 파일 불러오기
file_path = "off_coords_dongname.csv"
df = pd.read_csv(file_path, encoding="utf-8-sig")

# dong_name 처리 함수
def clean_dong_name(dong_name):
    if pd.isna(dong_name):
        return dong_name
    # 1.2.3 → 1·2·3
    dong_name = re.sub(r'(?<=\d)\.(?=\d)', '·', dong_name)
    # 숫자 앞에 오는 '제' 제거 (예: 면목제3·8동 → 면목3·8동)
    dong_name = re.sub(r'제(?=\d)', '', dong_name)
    return dong_name

# 적용
df['dong_name'] = df['dong_name'].apply(clean_dong_name)

# 저장
output_path = "new_off_coords_dongname.csv"
df.to_csv(output_path, index=False, encoding='utf-8-sig')

print(f"\n🎉 dong_name 처리 완료! 저장된 파일: {output_path}")
