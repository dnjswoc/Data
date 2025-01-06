-- WITH를 사용해 PRODUCT_ID 별 총 판매량을 구한 가상의 테이블을 만듦
WITH SALES_TB AS (
    SELECT
        PRODUCT_ID,
        SUM(SALES_AMOUNT) AS 'AMOUNT'
    FROM
        OFFLINE_SALE
    GROUP BY
        PRODUCT_ID
)
SELECT
    p.PRODUCT_CODE,
    -- 가격 * 총 판매량으로 상품코드별 매출액을 계산
    p.PRICE * s.AMOUNT AS 'SALES'
FROM
    PRODUCT p
JOIN
    SALES_TB s
ON
    p.PRODUCT_ID = s.PRODUCT_ID
ORDER BY
    -- 총 매출액 기준 내림차순, 상품코드 기준 오름차순 정렬
    SALES DESC,
    PRODUCT_CODE ASC;