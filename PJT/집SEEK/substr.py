import pandas as pd
import re

# CSV 불러오기
df = pd.read_csv("./seoul_data/여가점수_중복제거.csv", encoding="utf-8-sig")

# 정규표현식 기반으로 name에서 구분 정보 제거 함수 정의
def clean_name(name):
    original = name
    # 괄호 안의 정보 중 관/지점/센터/층 등 제거 (홀은 유지)
    name = re.sub(r"\(.*?[관지점센터공연장층상영관]\)", "", name)

    # 공백 포함한 'X관', 'X지점', 'X센터', 'X층' 등 제거
    name = re.sub(r"\s*[0-9]+[관지점센터공연장층]$", "", name)
    name = re.sub(r"\s*[가-힣]+[관지점센터공연장층]$", "", name)
    name = re.sub(r"\s*(제)?[0-9]+[호관층]", "", name)

    # ★ '홀'은 제거하지 않음
    name = re.sub(r"\s*(상영관|지점|관|센터|공연장|층)$", "", name)

    # 공백 정리
    name = re.sub(r"\s+", " ", name).strip()

    if original != name:
        print(f"🔧 정리됨: '{original}' → '{name}'")
    return name

# name 정리 적용
df['name'] = df['name'].apply(clean_name)

# 저장
output_path = "./seoul_data/여가점수_이름정리_홀유지.csv"
df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 이름 정리 완료! (홀 유지) → 저장된 파일: {output_path}")
