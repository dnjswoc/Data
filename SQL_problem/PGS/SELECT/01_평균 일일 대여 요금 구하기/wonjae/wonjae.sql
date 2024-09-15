/*
다음은 어느 자동차 대여 회사에서 대여 중인 자동차들의 정보를 담은
CAR_RENTAL_COMPANY_CAR 테이블입니다. CAR_RENTAL_COMPANY_CAR 테이블은 아래와 같은
구조로 되어있으며, CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS 는 각각 자동차 ID, 자동차 종류,
일일 대여 요금(원), 자동차 옵션 리스트를 나타냅니다.

자동차 종류는 '세단', 'SUV', '승합차', '트럭', '리무진'이 있습니다. 자동차 옵션 리스트는
콤마(',')로 구분된 키워드 리스트(예 : '열선시트', '스마트키', '주차감지센서')로 되어있으며,
키워드 종류는 '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트'가 있습니다.

문제
CAR_RENTAL_COMPANY_CAR 테이블에서 자동차 종류가 'SUV'인 자동차들의 평균 일일 대여 요금을 출력하는
SQL문을 작성해주세요. 이때 평균 일일 대여 요금은 소수 첫 번재 자리에서 반올림하고, 컬럼명은 AVERAGE_FEE로
지정해주세요.
*/



SELECT
    ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE
    -- ROUND(x [, d]) : x의 반올림 값을 반환하고, d는 d번째 소수점 자릿수에서 반올림을 의미
    -- AS : alias로 칼럼명 임시 네이밍을
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE
    CAR_TYPE = 'SUV'
    -- WHERE 절로 자동차 종류가 'SUV'라는 조건을 설정