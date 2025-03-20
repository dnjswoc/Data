import pandas as pd
import geopandas as gpd
from shapely.geometry import Point
from sklearn.preprocessing import MinMaxScaler


# 📌 1️⃣ 서울 행정동 GeoJSON 파일 불러오기
geojson_path = "서울시_행정동_경계.geojson"
gdf_admin = gpd.read_file(geojson_path)


# 📌 좌표계 확인
print(f"현재 좌표계: {gdf_admin.crs}")

# 📌 EPSG:4326으로 변환
if gdf_admin.crs != "EPSG:4326":
    gdf_admin = gdf_admin.to_crs("EPSG:4326")

# 📌 변환된 데이터 확인
print(gdf_admin.head())

# 📌 2️⃣ 버스 & 지하철 데이터 불러오기 (XLSX 파일)
bus_df = pd.read_excel("서울시_버스정류장.xlsx", sheet_name=0, usecols=["X좌표", "Y좌표"])
subway_df = pd.read_csv("서울시_지하철역.csv", usecols=["환승역X좌표", "환승역Y좌표"])

# 📌 3️⃣ 좌표 데이터를 GeoDataFrame으로 변환
bus_gdf = gpd.GeoDataFrame(bus_df, geometry=gpd.points_from_xy(bus_df["X좌표"], bus_df["Y좌표"]), crs="EPSG:4326")
subway_gdf = gpd.GeoDataFrame(subway_df, geometry=gpd.points_from_xy(subway_df["환승역X좌표"], subway_df["환승역Y좌표"]), crs="EPSG:4326")

# 📌 4️⃣ 좌표를 행정동과 매칭 (Spatial Join)
bus_gdf = gpd.sjoin(bus_gdf, gdf_admin, how="left", predicate="within")
subway_gdf = gpd.sjoin(subway_gdf, gdf_admin, how="left", predicate="within")

print(bus_gdf.head())

# 📌 5️⃣ 행정동별 개수 집계
bus_count = bus_gdf.groupby("ADM_CD").size().reset_index(name="버스 정류장 수")
subway_count = subway_gdf.groupby("ADM_CD").size().reset_index(name="지하철역 수")

# 📌 6️⃣ 버스 + 지하철 데이터를 병합 후 "대중교통 점수" 계산
df_transport = pd.merge(bus_count, subway_count, on="ADM_CD", how="outer").fillna(0)
df_transport["총 대중교통 수"] = df_transport["버스 정류장 수"] + df_transport["지하철역 수"]

print(df_transport)


# 📌 1️⃣ 행정동 코드(ADM_CD)와 행정동 이름(ADM_NM) 매핑 데이터 생성
adm_mapping = gdf_admin[["ADM_CD", "ADM_NM"]].drop_duplicates()

# 📌 2️⃣ df_transport에 ADM_NM 추가 (ADM_CD 기준 병합)
df_transport = df_transport.merge(adm_mapping, on="ADM_CD", how="left")

df_transport["지하철역 수"] = pd.to_numeric(df_transport["지하철역 수"]).astype(int)
df_transport["총 대중교통 수"] = pd.to_numeric(df_transport["총 대중교통 수"]).astype(int)
# 📌 3️⃣ 결과 확인
print(df_transport.head())

df_census = pd.read_excel("센서스 공간정보 지역 코드.xlsx", sheet_name=0)
print(df_census.info())
# 📌 1️⃣ 올바른 컬럼명을 수동 설정
# df_census.columns = ["시도코드", "시군구코드", "시군구명칭", "읍면동코드", "읍면동명칭"]
# df_census = df_census[["시군구코드", "읍면동코드", "시군구명칭", "읍면동명칭"]].drop_duplicates()

# 📌 2️⃣ df_transport의 ADM_CD에서 시군구코드, 읍면동코드 추출
df_transport["시군구코드"] = df_transport["ADM_CD"].astype(str).str[2:5]
df_transport["읍면동코드"] = df_transport["ADM_CD"].astype(str).str[5:]
df_transport["시군구코드"] = pd.to_numeric(df_transport["시군구코드"])
df_transport["읍면동코드"] = pd.to_numeric(df_transport["읍면동코드"])

# 📌 3️⃣ df_transport와 df_census를 시군구코드, 읍면동코드 기준으로 병합
df_transport = df_transport.merge(df_census, on=["시군구코드", "읍면동코드"], how="left")

# 선택할 칼럼 리스트 (원하는 칼럼명으로 변경)
selected_columns = ['시도명칭', '시군구명칭', '읍면동명칭', '버스 정류장 수', '지하철역 수', '총 대중교통 수']  # 원하는 칼럼명으로 수정

# 선택한 칼럼만 추출
df_selected = df_transport[selected_columns]

# 새로운 CSV 파일로 저장
output_path = "서울특별시_대중교통_수_업데이트.csv"
df_selected.to_csv(output_path, index=False, encoding="utf-8-sig")

print(f"선택한 칼럼만 포함된 CSV 파일이 저장되었습니다: {output_path}")