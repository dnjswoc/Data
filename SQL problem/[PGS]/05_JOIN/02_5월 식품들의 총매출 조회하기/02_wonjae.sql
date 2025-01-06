-- WITH를 사용하여 PRODUCT_ID를 그룹화하여 2022년 5월에 판매한
-- 상품의 총 매출량을 기록한 가상의 테이블을 생성
WITH AMOUNT_TB AS (
    SELECT
        PRODUCT_ID,
        SUM(AMOUNT) AS 'TOTAL'
    FROM
        FOOD_ORDER
    WHERE
        PRODUCE_DATE LIKE '2022-05%'
    GROUP BY
        PRODUCT_ID)
SELECT
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    a.TOTAL * p.PRICE AS 'TOTAL_SALES'
FROM
    FOOD_PRODUCT p
JOIN
    AMOUNT_TB a
ON
    p.PRODUCT_ID = a.PRODUCT_ID
ORDER BY
    -- 총 매출액 기준 내림차순, PRODUCT_ID 기준으로 오름차순
    TOTAL_SALES DESC,
    p.PRODUCT_ID ASC;