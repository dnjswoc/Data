SELECT
    CAR_ID,
    CAR_TYPE,
    DAILY_FEE,
    OPTIONS
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE
    -- 옵션에 네비게이션이 들어가는 자동차 정보 조회
    OPTIONS LIKE '%네비게이션%'
ORDER BY
    -- CAR_ID 기준으로 내림차순 정렬
    CAR_ID DESC;