import geopandas as gpd

# Shapefile 로드
shp_path = "서울시_행정동_경계.shp"
gdf = gpd.read_file(shp_path)

gdf_seoul = gdf[gdf["ADM_CD"].str.startswith("11")]  # 예시: 서울 코드가 '11'로 시작

# 📌 3️⃣ 서울시 행정동 데이터 GeoJSON으로 저장
geojson_path = "서울시_행정동_경계.geojson"
gdf_seoul.to_file(geojson_path, driver="GeoJSON")

print(f"✅ 변환 완료: {geojson_path}")