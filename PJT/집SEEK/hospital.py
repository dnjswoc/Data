import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# 데이터 불러오기
hospital_data = pd.read_csv('./seoul_hospital.csv', encoding="cp949")




# 구 + 법정동 추출
hospital_data[["구", "법정동_원본"]] = hospital_data["주소"].str.extract(r"서울특별시\s*(\S+구).*\(([^)]+)\)$")

# ✅ 콤마(,)가 있는 경우 첫 번째 값(법정동)만 추출
hospital_data["법정동"] = hospital_data["법정동_원본"].str.split(",").str[0].str.strip()

# ✅ '동' 또는 '가'로 끝나는 경우만 추출 (상가 이름 제거)
hospital_data["법정동"] = hospital_data["법정동"].str.extract(r"([가-힣0-9]+(?:동|가))$")


hospital_data["법정동"] = hospital_data["법정동"].replace("흑석한강센트레빌상가", "흑석동")

# 도로명 주소가 ~~가 로 끝나는 데이터 삭제 => 선택적
hospital_data.dropna(subset=["법정동"], inplace=True)



# print(hospital_data["구"].unique())
# print(hospital_data["법정동"].unique())



# 병원 유형별 가중치 설정
weights = {
    "의원" : 1,
    "병원" : 2,
    "치과의원" : 1,
    "한방병원" : 0.7,
    "한의원" : 0.5,
    "치과병원" : 1.5,
    "요양병원" : 0.5,
    "종합병원" : 3,
    "기타" : 0.3,
    "보건소" : 1,
    "기타(구급차)" : 0.3
}

# 병원 유형 별 가중치 적용(해당 유형이 없으면 0할당)
hospital_data["가중치"] = hospital_data["병원분류명"].map(weights).fillna(0)

# print(hospital_data["가중치"])

# 구, 법정동 별 점수 합산
hospital_scores = hospital_data.groupby(["구", "법정동"])["가중치"].sum().reset_index()

# print(hospital_scores)

# 점수 높은 순으로 정렬
hospital_scores = hospital_scores.sort_values(by="가중치", ascending=False)

# print(hospital_scores)

# 법정동별 병원 개수
hospital_counts = hospital_data.groupby("법정동")["병원분류명"].count().reset_index(name="병원 개수")

# 기존 병원 점수와 병원 개수를 병합
hospital_scores = hospital_scores.merge(hospital_counts, on="법정동", how="left")

# 평균 점수 계산 (법정동별 총 가중치 / 병원 개수)
hospital_scores["평균 점수"] = hospital_scores["가중치"] / hospital_scores["병원 개수"]

# 최소-최대 정규화로 점수를 0~100으로 설정
hospital_scores["정규화 점수"] = (hospital_scores["가중치"] - hospital_scores["가중치"].min()) / (hospital_scores["가중치"].max() - hospital_scores["가중치"].min()) * 100

print(hospital_scores)

