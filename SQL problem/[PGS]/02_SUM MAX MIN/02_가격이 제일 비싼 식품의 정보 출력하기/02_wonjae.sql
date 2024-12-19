SELECT
    -- AS를 통해 컬럼 이름 변경
    PRICE AS 'MAX_PRICE'
FROM
    PRODUCT
ORDER BY
    -- 가장 높은 판매가를 조회하기 위해 가격 내림차순 후 1개 데이터 추출
    PRICE DESC
LIMIT
    1;