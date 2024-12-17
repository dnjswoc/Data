SELECT
    *
FROM
    FOOD_PRODUCT
ORDER BY
    -- 가격이 가장 비싼 식품의 정보를 조회하기 위해 내림차순 후 1개만 추출
    PRICE DESC
LIMIT
    1;