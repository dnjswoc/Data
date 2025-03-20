import pandas as pd
import numpy as np
import matplotlib as plt
import os

# 서울특별시 인구 데이터 읽어오기
dong = pd.read_csv("./seoul_population.csv", usecols=["시도명", "시군구명", "읍면동명", "계"], encoding="cp949")

dong = dong[dong["시도명"] == "서울특별시"]
print(dong.head())

# 서울특별시 병원 위치 데이터 읽어오기
hospital = pd.read_csv('./seoul_hospital.csv', encoding="cp949")

# 구 + 법정동 추출
hospital[["구", "법정동_원본"]] = hospital["주소"].str.extract(r"서울특별시\s*(\S+구).*\(([^)]+)\)$")

# ✅ 콤마(,)가 있는 경우 첫 번째 값(법정동)만 추출
hospital["법정동"] = hospital["법정동_원본"].str.split(",").str[0].str.strip()

# ✅ '동' 또는 '가'로 끝나는 경우만 추출 (상가 이름 제거)
hospital["법정동"] = hospital["법정동"].str.extract(r"([가-힣0-9]+(?:동|가))$")


hospital["법정동"] = hospital["법정동"].replace("흑석한강센트레빌상가", "흑석동")

# 도로명 주소가 ~~가 로 끝나는 데이터 삭제 => 선택적
hospital.dropna(subset=["법정동"], inplace=True)

print(hospital[["구", "법정동"]].head())



# 도로명 주소가 ~~가 로 끝나는 데이터 삭제 => 선택적
hospital.dropna(subset=["법정동"], inplace=True)

# 구, 법정동 별 병원 수 합산(추정치 고려)
def hospital_weight(hospital):

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
    hospital["병원가중치"] = hospital["병원분류명"].map(weights).fillna(0)

    # print(hospital["가중치"])

    # 구, 법정동 별 점수 합산
    hospital_scores = hospital.groupby(["구", "법정동"])["병원가중치"].sum().reset_index()

    print(hospital_scores)

    return hospital_scores



hospital_score = hospital_weight(hospital)


# 서울시 인구 데이터와 병원 위치 데이터를 구, 법정동명 별로 join
dong = pd.merge(dong, hospital_score, left_on=["시군구명", "읍면동명"], right_on=["구", "법정동"], how="outer").fillna(0)

dong["병원"] = (hospital_score["병원가중치"] / dong["계"])


dong_scores = dong.sort_values(by="병원", ascending=False)

print(dong_scores)

nan_count = dong_scores["병원"].isna().sum()

print(nan_count)

