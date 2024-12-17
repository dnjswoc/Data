SELECT
    -- AS를 통해 칼럼 이름 MAX_PRICE로 변경
    PRICE AS 'MAX_PRICE'
FROM
    PRODUCT
ORDER BY
    -- 가장 높은 판매가 출력하기 위해 가격 내림차순 후 1개 추출
    PRICE DESC
LIMIT
    1;