SELECT
    DISTINCT CAR_ID
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    -- 대여 시작일이 2022년 10월이고
    START_DATE LIKE '2022-10%' AND
    -- 자동차 종류가 '세단'인 자동차 데이터 조회
    CAR_ID IN (
        SELECT
            CAR_ID
        FROM
            CAR_RENTAL_COMPANY_CAR
        WHERE
            CAR_TYPE = '세단'
    )
ORDER BY
    -- CAR_ID 기준으로 내림차순 정렬
    CAR_ID DESC;