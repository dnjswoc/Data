SELECT
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d'),
    -- 2022년 5월 1일 기준으로 출고 여부 기록
    CASE WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
        ELSE '출고미정'
        END AS '출고여부'
FROM
    FOOD_ORDER
ORDER BY
    -- ORDER_ID 기준으로 오름차순 정렬
    ORDER_ID ASC;