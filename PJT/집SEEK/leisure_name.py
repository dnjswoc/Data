import pandas as pd
import re

# CSV 파일 불러오기
df = pd.read_csv("./seoul_data/여가점수_중복제거.csv", encoding="utf-8-sig")

# 관 관련 표현 정리 함수
def clean_kan(name):
    original = name

    # 1. '제1관', '제2전시장', '제1전시관' → '제X' + 한글 단어 제거
    name = re.sub(r"제\s*\d+[가-힣]*관", "", name)
    name = re.sub(r"제\s*\d+[가-힣]*장", "", name)

    # 2. '1관', '2관', '3전시장', '3전시관', '3전시홀' → 숫자+한글
    name = re.sub(r"\b\d+\s*[가-힣]*(관|장|홀)\b", "", name)

    # 3. 'A관', 'B관' 등 알파벳+관
    name = re.sub(r"\b[A-Z]+\s*관\b", "", name)

    # 4. '센터 1관', '극장 2관'처럼 중간에 있는 경우
    name = re.sub(r"(센터|극장)\s*\d+\s*관", "", name)

    # 5. 괄호 안에 관 정보 제거
    name = re.sub(r"\(.*?[관장홀]\)", "", name)

    # 6. 끝에 '관'만 단독으로 남은 경우 제거
    name = re.sub(r"\s*관$", "", name)

    # 7. 공백 정리
    name = re.sub(r"\s+", " ", name).strip()

    if name != original:
        print(f"🔧 정리됨: '{original}' → '{name}'")
    return name

# 정리 적용
df["name"] = df["name"].apply(clean_kan)

df = df.dropna()

# 저장
output_path = "./seoul_data/여가점수_이름정리_관정리.csv"
df.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"\n🎉 '관' 관련 표현 정리 완료! 저장된 파일: {output_path}")
