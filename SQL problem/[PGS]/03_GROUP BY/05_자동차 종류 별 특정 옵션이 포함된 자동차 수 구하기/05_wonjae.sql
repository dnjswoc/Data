SELECT
    CAR_TYPE,
    COUNT(*) AS 'CARS'
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE
    -- 통풍시트, 열선시트, 가죽시트가 하나라도 있으면 데이터 추출
    OPTIONS LIKE '%통풍시트%' OR
    OPTIONS LIKE '%열선시트%' OR
    OPTIONS LIKE '%가죽시트%'
GROUP BY
    -- CAR_TYPE 별 데이터 개수 구하기
    CAR_TYPE
ORDER BY
    CAR_TYPE ASC;