SELECT
    CATEGORY,
    -- AS를 통해 MAX_PRICE로 컬럼명 변경
    PRICE AS 'MAX_PRICE',
    PRODUCT_NAME
FROM
    FOOD_PRODUCT
WHERE
    -- 서브쿼리로 카테고리별 최댓값인 데이터 추출
    PRICE IN (
        SELECT
            MAX(PRICE)
        FROM
            FOOD_PRODUCT
        GROUP BY
            CATEGORY
    -- 카테고리 조건 추가
    ) AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY
    -- 가격 내림차순 정렬
    PRICE DESC;