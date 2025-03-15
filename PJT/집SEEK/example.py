import os
import json
import pandas as pd
import numpy as np

# JSON 파일들이 저장된 폴더 경로 (사용자의 JSON 파일이 있는 디렉토리로 변경)
folder_path = os.getcwd()

# 모든 JSON 파일을 읽어서 데이터 저장
data_list = []

# 폴더 내 JSON 파일 반복 처리
for filename in os.listdir(folder_path):
    if filename.endswith(".json"):
        file_path = os.path.join(folder_path, filename)
        
        # JSON 파일 읽기
        with open(file_path, "r", encoding="utf-8-sig") as f:
            json_data = json.load(f)
        
        # JSON 데이터에서 필요한 값 추출
        for entry in json_data:
            location_parts = entry["location"].split()  # "서울특별시 강남구 역삼1동" -> ["서울특별시", "강남구", "역삼1동"]
            if len(location_parts) >= 3:
                si, gu, dong = location_parts[:3]  # 서울특별시, 강남구, 역삼1동
                data_list.append({
                    "주소1": si,
                    "주소2": gu,
                    "주소3": dong,
                    "dataType": entry["dataType"],
                    "value": int(entry["value"])  # 값은 숫자로 변환
                })

# 데이터프레임 생성
df = pd.DataFrame(data_list)

# 피벗 테이블을 사용하여 dataType별 점수 정리
df_pivot = df.pivot_table(index=["주소1", "주소2", "주소3"], columns="dataType", values="value", aggfunc=np.sum, fill_value=0).reset_index()


# 칼럼 순서 정리
columns_order = ["주소1", "주소2", "주소3", "범죄 안전", "생활 안전", "병원 수", "의원 수", "약국 수", "편의 시설 수",
                 "체육시설 수", "문화시설 수", "백화점 수", "대형 마트 수", "슈퍼마켓 & 편의점 수", "외식 시설 수", "CCTV 분포 현황"]
df_pivot = df_pivot.reindex(columns=columns_order, fill_value=0)

# 결과 CSV 파일로 저장
output_csv_path = "./서울특별시_행정동별_데이터.csv"
df_pivot.to_csv(output_csv_path, index=False, encoding="utf-8-sig")

print(f"✅ CSV 파일 저장 완료: {output_csv_path}")
