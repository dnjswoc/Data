import pandas as pd
import os
from sklearn.preprocessing import MinMaxScaler

# 인구까지 업데이트 된 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_데이터_업데이트_면적.csv"
df_data = pd.read_csv(data_file, encoding="utf-8-sig")
df_transport = pd.read_csv("서울특별시_대중교통_수_업데이트.csv", encoding="utf-8-sig")


# print(df_data.head())
# print(df_transport.head())

# df_transport에서 사용할 칼럼 추출
df_transport = df_transport[['시군구명칭', '읍면동명칭', '총 대중교통 수']]

# df_transport에서 추출한 칼럼명 변경
df_transport.rename(columns={'시군구명칭': '주소2', '읍면동명칭': '주소3'}, inplace=True)

# df_data와 df_transport merge
df_data = df_data.merge(df_transport, on=['주소2', '주소3'], how='left')

# print(df_data.head())

scaler = MinMaxScaler(feature_range=(20, 100))


# 안전 점수
def safe_score():

    # 범죄 안전, 생활 안전은 1(좋음) ~ 5(나쁨) 으로 점수가 매겨져 있음
    # 1 => 100점, 2 => 80점, ... , 5 => 20점으로 변환
    df_data["범죄 안전 점수"] = 120 - (df_data["범죄 안전"] * 20)
    df_data["생활 안전 점수"] = 120 - (df_data["생활 안전"] * 20)

    # CCTV 분포 현황을 인구 수로 나누어서 20~100 최대,최소 정규화
    df_data["1인당 CCTV 분포 현황"] = df_data["CCTV 분포 현황"] / df_data["인구"]
    df_data["1인당 CCTV 점수"] = scaler.fit_transform(df_data[["1인당 CCTV 분포 현황"]])

    # 세 점수를 합쳐서 3으로 나눈 값을 1인당 안전 점수로 설정
    df_data["1인당 안전"] = (df_data["범죄 안전 점수"] + df_data["생활 안전 점수"] + df_data["1인당 CCTV 점수"]) / 3

    # CCTV 분포 현황을 면적으로 나누어서 20~100 최대,최소 정규화
    df_data["면적당 CCTV 분포 현황"] = df_data["CCTV 분포 현황"] / df_data["면적(km²)"]
    df_data["면적당 CCTV 점수"] = scaler.fit_transform(df_data[["면적당 CCTV 분포 현황"]])

    # 세 점수를 합쳐서 3으로 나눈 값을 면적당 안전 점수로 설정
    df_data["면적당 안전"] = (df_data["범죄 안전 점수"] + df_data["생활 안전 점수"] + df_data["면적당 CCTV 점수"]) / 3

    df_data["안전"] = (df_data["1인당 안전"] + df_data["면적당 안전"]) / 2
    df_data["안전"] = df_data["안전"].round(0).astype(int)

    return df_data




# 여가 점수
def leisure_score():

    # 1인당 누릴 수 있는 문화시설과 체육시설의 수를 구하기 위해 문화시설과 체육시설의 수를 동네의 인구수로 나눔
    df_data["1인당 문화시설 수"] = df_data["문화시설 수"] / df_data["인구"]
    df_data["1인당 체육시설 수"] = df_data["체육시설 수"] / df_data["인구"]
    
    # 1인당 여가 점수를 구하기 위해 최대,최소 정규화 후 산술 평균을 구함
    df_data["1인당 문화시설 수"] = scaler.fit_transform(df_data[["1인당 문화시설 수"]])
    df_data["1인당 체육시설 수"] = scaler.fit_transform(df_data[["1인당 체육시설 수"]])
    df_data["1인당 여가"] = (df_data["1인당 문화시설 수"] + df_data["1인당 체육시설 수"]) / 2


    # 면적당 문화시설과 체육시설의 수를 구하기 위해 문화시설과 체육시설의 수를 면적으로 나눔
    df_data["면적당 문화시설 수"] = df_data["문화시설 수"] / df_data["면적(km²)"]
    df_data["면적당 체육시설 수"] = df_data["체육시설 수"] / df_data["면적(km²)"]
    
    # 면적당 여가 점수를 구하기 위해 최대,최소 정규화 후 산술 평균을 구함
    df_data["면적당 문화시설 수"] = scaler.fit_transform(df_data[["면적당 문화시설 수"]])
    df_data["면적당 체육시설 수"] = scaler.fit_transform(df_data[["면적당 체육시설 수"]])
    df_data["면적당 여가"] = (df_data["면적당 문화시설 수"] + df_data["면적당 체육시설 수"]) / 2


    # 인구 수와 면적을 고려한 여가 점수를 구하기 위해 1인당 여가 점수와 면적당 여가 점수를 산술 평균 낸다.
    df_data["여가"] = (df_data["1인당 여가"] + df_data["면적당 여가"]) / 2
    df_data["여가"] = df_data["여가"].round(0).astype(int)

    return df_data




# 식당 점수
def restaurant_score():

    # 1인당, 면적당 외식 시설 수 계산
    df_data["1인당 외식 시설 수"] = df_data["외식 시설 수"] / df_data["인구"]
    df_data["면적당 외식 시설 수"] = df_data["외식 시설 수"] / df_data["면적(km²)"]

    # 위 계산 값 최대,최소 정규화
    df_data["1인당 외식 시설 수"] = scaler.fit_transform(df_data[["1인당 외식 시설 수"]])
    df_data["면적당 외식 시설 수"] = scaler.fit_transform(df_data[["면적당 외식 시설 수"]])

    # 1인당 외식 시설 수, 면적당 외식 시설 수를 산술 평균 내어 식당 점수로 설정
    df_data["식당"] = (df_data["1인당 외식 시설 수"] + df_data["면적당 외식 시설 수"]) / 2
    df_data["식당"] = df_data["식당"].round(0).astype(int)

    return df_data





# 의료 점수
def medical_score():
    # 병원 종류에 따른 가중치 부여
    medical_weights = {
        "병원 수" : 1.3,
        "의원 수" : 1,
        "약국 수" : 0.7
    }

    # 가중치의 합 계산
    df_data["병원가중치"] = (df_data["병원 수"] * medical_weights["병원 수"]) + (df_data["의원 수"] * medical_weights["의원 수"]) + (df_data["약국 수"] * medical_weights["약국 수"])

    # 1인당 및 면적당 의료 시설 점수 계산과 최대,최소 정규화
    df_data["1인당 의료 시설"] = df_data["병원가중치"] / df_data["인구"]
    df_data["면적당 의료 시설"] = df_data["병원가중치"] / df_data["면적(km²)"]

    df_data["1인당 의료 시설"] = scaler.fit_transform(df_data[["1인당 의료 시설"]])
    df_data["면적당 의료 시설"] = scaler.fit_transform(df_data[["면적당 의료 시설"]])


    # 1인당 의료 시설 점수와 면적당 의료 시설 점수를 산술 평균 내어 의료 점수로 설정
    df_data["의료"] = (df_data["1인당 의료 시설"] + df_data["면적당 의료 시설"]) / 2
    df_data["의료"] = df_data["의료"].round(0).astype(int)

    return df_data




# 마트 점수
def store_score():
    store_weights = {
        "백화점 수" : 2,
        "대형 마트 수" : 1.5,
        "슈퍼마켓 & 편의점 수" : 1
    }

    df_data["마트가중치"] = (df_data["백화점 수"] * store_weights["백화점 수"]) + (df_data["대형 마트 수"] * store_weights["대형 마트 수"]) + (df_data["슈퍼마켓 & 편의점 수"] * store_weights["슈퍼마켓 & 편의점 수"])

    # 1인당 및 면적당 마트 점수 계산과 최대,최소 정규화
    df_data["1인당 마트"] = df_data["마트가중치"] / df_data["인구"]
    df_data["면적당 마트"] = df_data["마트가중치"] / df_data["면적(km²)"]

    df_data["1인당 마트"] = scaler.fit_transform(df_data[["1인당 마트"]])
    df_data["면적당 마트"] = scaler.fit_transform(df_data[["면적당 마트"]])


    # 1인당 의료 시설 점수와 면적당 의료 시설 점수를 산술 평균 내어 의료 점수로 설정
    df_data["마트"] = (df_data["1인당 마트"] + df_data["면적당 마트"]) / 2
    df_data["마트"] = df_data["마트"].round(0).astype(int)

    return df_data



# 대중교통 점수
def transport_score():

    # 1인당 및 면적당 대중고툥 점수 계산 후 최대,최소 정규화
    df_data["1인당 대중교통 점수"] = df_data["총 대중교통 수"] / df_data["인구"]
    df_data["면적당 대중교통 점수"] = df_data["총 대중교통 수"] / df_data["면적(km²)"]

    df_data["1인당 대중교통 점수"] = scaler.fit_transform(df_data[["1인당 대중교통 점수"]])
    df_data["면적당 대중교통 점수"] = scaler.fit_transform(df_data[["면적당 대중교통 점수"]])


    # 1인당 의료 시설 점수와 면적당 의료 시설 점수를 산술 평균 내어 의료 점수로 설정
    df_data["대중교통"] = (df_data["1인당 대중교통 점수"] + df_data["면적당 대중교통 점수"]) / 2
    df_data["대중교통"] = df_data["대중교통"].round(0).astype(int)

    return df_data


# 편의시설 점수
def amenity_score():

    # 1인당 및 면적당 편의 시설 점수 계산 후 최대,최소 정규화
    df_data["1인당 편의 시설 수"] = df_data["편의 시설 수"] / df_data["인구"]
    df_data["면적당 편의 시설 수"] = df_data["편의 시설 수"] / df_data["면적(km²)"]

    df_data["1인당 편의 시설 수"] = scaler.fit_transform(df_data[["1인당 편의 시설 수"]])
    df_data["면적당 편의 시설 수"] = scaler.fit_transform(df_data[["면적당 편의 시설 수"]])


    # 1인당 의료 시설 점수와 면적당 의료 시설 점수를 산술 평균 내어 의료 점수로 설정
    df_data["편의 시설"] = (df_data["1인당 편의 시설 수"] + df_data["면적당 편의 시설 수"]) / 2
    df_data["편의 시설"] = df_data["편의 시설"].round(0).astype(int)

    return df_data



safe_score()
leisure_score()
restaurant_score()
medical_score()
store_score()
transport_score()
amenity_score()

print(df_data.head())

selected_columns = ["주소1", "주소2", "주소3", "인구", "면적(km²)", "안전", "여가", "식당", "의료", "마트", "편의 시설"]


df_data[selected_columns].to_csv("서울특별시_행정동별_선호항목_최종점수.csv", index=False, encoding="utf-8-sig")

print("csv 파일 생성 완료")