import pandas as pd
import os
from sklearn.preprocessing import MinMaxScaler

# 인구까지 업데이트 된 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_데이터_업데이트.csv"
df_data = pd.read_csv(data_file, encoding="utf-8-sig")

print(df_data.head())

scaler = MinMaxScaler(feature_range=(20, 100))


# 안전 점수
def safe_score():

    # 범죄 안전, 생활 안전은 1(좋음) ~ 5(나쁨) 으로 점수가 매겨져 있음
    # 1 => 100점, 2 => 80점, ... , 5 => 20점으로 변환
    df_data["범죄 안전 점수"] = 120 - (df_data["범죄 안전"] * 20)
    df_data["생활 안전 점수"] = 120 - (df_data["생활 안전"] * 20)

    # CCTV 분포 현황은 인구 수로 나누어서 20~100 최대,최소 정규화
    df_data["CCTV 분포 현황"] = df_data["CCTV 분포 현황"] / df_data["인구"]
    df_data["CCTV 점수"] = scaler.fit_transform(df_data[["CCTV 분포 현황"]])

    # 세 점수를 합쳐서 3으로 나눈 값을 안전 점수로 설정
    df_data["안전"] = (df_data["범죄 안전 점수"] + df_data["생활 안전 점수"] + df_data["CCTV 점수"]) / 3

    return df_data

safe_score()


# 여가 점수
def leisure_score():
    df_data["문화시설 수"] = df_data["문화시설 수"] / df_data["인구"]
    df_data["체육시설 수"] = df_data["체육시설 수"] / df_data["인구"]
    
    df_data["문화시설 수"] = scaler.fit_transform(df_data[["문화시설 수"]])
    df_data["체육시설 수"] = scaler.fit_transform(df_data[["체육시설 수"]])
    df_data["여가"] = (df_data["문화시설 수"] + df_data["체육시설 수"]) / 2

    return df_data

leisure_score()


# 식당 점수
def restaurant_score():
    df_data["외식 시설 수"] = df_data["외식 시설 수"] / df_data["인구"]

    df_data["식당"] = scaler.fit_transform(df_data[["외식 시설 수"]])

    return df_data

restaurant_score()

print(df_data.head())
print(df_data["식당"].max())
print(df_data["식당"].min())


# 의료 점수
def medical_score():
    medical_weights = {
        "병원 수" : 1.3,
        "의원 수" : 1,
        "약국 수" : 0.7
    }

    df_data["병원가중치"] = (df_data["병원 수"] * medical_weights["병원 수"]) + (df_data["의원 수"] * medical_weights["의원 수"]) + (df_data["약국 수"] * medical_weights["약국 수"])

    df_data["병원가중치"] = scaler.fit_transform(df_data[["병원가중치"]])

    return df_data


medical_score()

print(df_data.head())
print(df_data["병원가중치"].max())
print(df_data["병원가중치"].min())


# 마트 점수
def store_score():
    store_weights = {
        "백화점 수" : 2,
        "대형 마트 수" : 1.5,
        "슈퍼마켓 & 편의점 수" : 1
    }

    df_data["마트가중치"] = (df_data["백화점 수"] * store_weights["백화점 수"]) + (df_data["대형 마트 수"] * store_weights["대형 마트 수"]) + (df_data["슈퍼마켓 & 편의점 수"] * store_weights["슈퍼마켓 & 편의점 수"])

    df_data["마트가중치"] = scaler.fit_transform(df_data[["마트가중치"]])

    return df_data

store_score()

print(df_data.head())
print(df_data["마트가중치"].min())
print(df_data["마트가중치"].max())


# 대중교통 점수
def transport_score():

    return df_data


# 편의시설 점수
def amenity_score():
    df_data["편의 시설 수"] = df_data["편의 시설 수"]
    return df_data