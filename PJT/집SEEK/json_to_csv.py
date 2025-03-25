import json
import pandas as pd

# JSON 파일 불러오기
with open('seoul_dong_centroids_from_geojson.json', encoding='utf-8') as f:
    data = json.load(f)

# DataFrame으로 변환
df = pd.DataFrame(data)

# CSV 파일로 저장
df.to_csv('seoul_dong_centroids.csv', index=False, encoding='utf-8-sig')
