SELECT
    # TRUNCATE 버림 함수 사용
    # TRUNCATE(숫자, 자릿수) 자릿수 양수 소수점 / 자릿수 음수 정수부분 버림
    # TRUNCATE(1.234, 2) => 1.23
    # TRUNCATE(1234, -2) => 1200
    TRUNCATE(PRICE,-4) AS PRICE_GROUP,
    COUNT(PRODUCT_ID) PRODUCTS
FROM
    PRODUCT
GROUP BY
    PRICE_GROUP
ORDER BY
    PRICE_GROUP;