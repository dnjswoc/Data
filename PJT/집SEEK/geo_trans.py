import geopandas as gpd

# 한글 깨짐 방지: encoding="cp949" 또는 "euc-kr" 시도
gdf = gpd.read_file("./LARD_ADM_SECT_SGG_서울/LARD_ADM_SECT_SGG_11_202502.shp", encoding="cp949")

# GeoJSON으로 저장 (UTF-8)
gdf.to_file("서울시_행정동_경계_UTF8.geojson", driver="GeoJSON", encoding="utf-8")

print("✅ 변환 완료: 한글이 깨지지 않는 GeoJSON 생성됨")
