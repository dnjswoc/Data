import requests
import json
import os

# ✅ 서울특별시 25개 구별 지역 코드 매핑
region_code_map = {
    "강남구": "11230", "강동구": "11250", "강북구": "11090", "강서구": "11160",
    "관악구": "11210", "광진구": "11050", "구로구": "11170", "금천구": "11180",
    "노원구": "11110", "도봉구": "11100", "동대문구": "11060", "동작구": "11200",
    "마포구": "11140", "서대문구": "11130", "서초구": "11220", "성동구": "11040",
    "성북구": "11080", "송파구": "11240", "양천구": "11150", "영등포구": "11190",
    "용산구": "11030", "은평구": "11120", "종로구": "11010", "중구": "11020", "중랑구": "11070"
}

# ✅ 사용할 지표와 코드 매핑 (SGIS API)
selected_indicators = {
    "안전": {"D003": "범죄 안전", "D004": "생활 안전", "D006": "CCTV 분포 현황"},
    "여가": {"G009": "문화시설 수", "G010": "체육시설 수"},
    "의료 시설": {"G002": "병원 수", "G003": "의원 수", "G004": "약국 수"},
    "편의 시설": {"E001": "편의 시설 수"},
    "마트": {"E002": "백화점 수", "E003": "대형 마트 수", "E004": "슈퍼마켓 & 편의점 수"},
    "식당": {"E006": "외식 시설 수"}
}

# ✅ 모든 지표 리스트 생성
all_class_ids = [code for indicators in selected_indicators.values() for code in indicators.keys()]

# ✅ SGIS API 요청 함수
def send_house_status_request(url, region_cd, base_year, class_id):
    headers = {
        "Accept": "application/json, text/javascript, */*; q=0.01",
        "Accept-Encoding": "gzip, deflate, br, zstd",
        "Accept-Language": "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7",
        "Connection": "keep-alive",
        "Content-Type": "application/json",
        "Host": "sgis.kostat.go.kr",
        "Origin": "https://sgis.kostat.go.kr",
        "Referer": "https://sgis.kostat.go.kr/view/house/houseAnalysisMap",
        "Sec-Fetch-Dest": "empty",
        "Sec-Fetch-Mode": "cors",
        "Sec-Fetch-Site": "same-origin",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36",
        "X-Requested-With": "XMLHttpRequest",
        "sec-ch-ua": '"Chromium";v="134", "Not:A-Brand";v="24", "Google Chrome";v="134"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"Windows"'
    }
    
    payload = {
        "classId": class_id,
        "regionCd": region_cd,
        "baseYear": base_year
    }
    
    response = requests.post(url, headers=headers, json=payload)
    
    if response.status_code == 200:
        print(f"✅ 요청 성공! 지역코드: {region_cd}, 지표: {class_id}")
        data = response.json()
        
        results = []
        for feature in data.get("features", []):
            # 한글 지표명 매핑
            mapped_name = None
            for category, indicators in selected_indicators.items():
                if class_id in indicators:
                    mapped_name = indicators[class_id]
                    break
            
            result = {
                "location": feature.get("properties", {}).get('addr', ""),
                "dataType": mapped_name if mapped_name else class_id,
                "value": feature.get("properties", {}).get('value', "0")
            }
            results.append(result)
        
        return results
    else:
        print(f"🚨 요청 실패! 상태 코드: {response.status_code}")
        print(response.text)
        return []

# ✅ SGIS 데이터 요청 및 JSON 저장
def fetch_and_save_sgis_data(region_names, base_year="2024"):
    url = "https://sgis.kostat.go.kr/view/house/getHouseStatusDataList"

    for region_name in region_names:
        region_cd = region_code_map.get(region_name)
        
        if not region_cd:
            print(f"🚨 지역 코드 없음: {region_name}")
            continue  # 존재하지 않는 구 이름은 건너뜀

        region_data = []
        
        # 모든 지표 요청
        for class_id in all_class_ids:
            region_data.extend(send_house_status_request(url, region_cd, base_year, class_id))
        
        if region_data:
            # 파일명에서 "시 구 동"이면 "시 구"까지만 추출
            full_location = region_data[0]['location']
            location_parts = full_location.split()
            
            if len(location_parts) >= 2:
                si_gu_name = f"{location_parts[0]} {location_parts[1]}"  # "~~시 ~~구"
            else:
                si_gu_name = full_location  # 원래 값 사용
            
            filename = f"{si_gu_name}.json".replace(" ", "_")
            with open(filename, "w", encoding="utf-8") as json_file:
                json.dump(region_data, json_file, ensure_ascii=False, indent=4)
            
            print(f"✅ JSON 데이터 저장 완료: {filename}")

# ✅ 사용할 지역 구 이름 리스트 (강남구, 강동구 등)
region_names = ["마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]  # 예제 구

# ✅ 실행: 해당 구의 데이터 수집 및 저장
fetch_and_save_sgis_data(region_names)
