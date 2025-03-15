import pandas as pd
import os

# 📌 1️⃣ 서울특별시 행정동별 데이터 불러오기
data_file = "서울특별시_행정동별_데이터.csv"  # 기존 데이터
df_data = pd.read_csv(data_file, encoding="utf-8-sig")


# 서울특별시 행정동별 면적 데이터 불러오기
seoul_area = "seoul_population.csv"
df_population = pd.read_csv(seoul_area, usecols=[1, 2, 3], encoding="utf-8-sig")