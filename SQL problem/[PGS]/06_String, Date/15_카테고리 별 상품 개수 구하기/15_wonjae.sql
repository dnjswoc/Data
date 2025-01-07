SELECT
    -- PRODUCT_CODE의 앞 2자리 추출
    SUBSTRING(PRODUCT_CODE, 1, 2) AS 'CATEGORY',
    COUNT(PRODUCT_ID) AS 'PRODUCTS'
FROM
    PRODUCT
GROUP BY
    CATEGORY
ORDER BY
    --  CATEGORY 기준 오름차순 정렬
    CATEGORY ASC;