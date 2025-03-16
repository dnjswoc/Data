# 집SEEK 프로젝트 개발 관련 readme!

### 20250315(토)

- activity log(comment) dummy data 생성

  - Elasticsearch를 활용한 액티비리 로그 관련 고려 사항

    - 액티비티 로그가 계속 쌓이면 용량이 커질 수 있음
    - 예를 들어 3~6개월 치 데이터만 유지하고 오래된 데이터는 삭제하는 방법 고려(Index Lifecycle Management 활용)

  - timestamp 포맷

    - ISO 8601 포맷(YYYY-MM-DDTHH:MM:SSZ)를 사용하면 시간 정렬 & 분석 용이
    - Elasticsearch는 기본적으로 `date` 타입을 지원하므로, 인덱스 매핑을 설정하면 좋음

      ```json
      {
        "properties": {
          "timestamp": { "type": "date" }
        }
      }
      ```

  - IP 주소 & User-Agent(디바이스 정보)

    - 사용자의 환경을 추적하려면 IP 주소 및 디바이스 정보(User-Agent) 저장 고려
      ```json
      "ip_address": "192.168.1.1",
      "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
      ```
    - 특정 기기에서의 행동 패턴 분석, 부정 행위 탐지(예 : 동일 IP에서 다수의 찜) 가능

  - session_id (세션 정보)

    - 특정 유저의 활동 흐름을 분석하려면 세션 ID 저장이 유용함
      ```JSON
      "session_id": "abc123xyz"
      ```
    - 유저의 연속적인 행동 패턴 분석(예 : 특정 매물 조회 후 찜 여부) 가능


  - 데이터 정규화 vs 중복 저장

    - 현재 `destination`(목표 장소), `dest_address`(실제 주소) 등 문자열 데이터를 중복 저장
    - `destination_id`를 부여하고 별도 테이블 관리 가능(굳이??)
    - Elasticsearch에선 `nested` 필드나 `keyword` 타입을 적절히 활용하면 성능 문제 없이 처리 가능
    - Elasticsearch는 중복 데이터 저장 부담이 RDBMS 보다 적음, 현재 구조 그대로 유지해도 문제 없음