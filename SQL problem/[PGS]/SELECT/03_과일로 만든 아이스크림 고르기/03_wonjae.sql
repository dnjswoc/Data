SELECT
    FIRST_HALF.FLAVOR
FROM
    FIRST_HALF
JOIN
    ICECREAM_INFO
ON
    ICECREAM_INFO.FLAVOR = FIRST_HALF.FLAVOR
WHERE
-- 상반기 아이스크림 총 주문량이 3000보다 높으면서,
-- 아이스크림의 주 성분이 과일(fruit_based)이다.
    FIRST_HALF.TOTAL_ORDER > 3000
    AND ICECREAM_INFO.INGREDIENT_TYPE = 'fruit_based'
ORDER BY
-- 상반기 아이스크림 총 주문량이 큰 순서대로 정렬
    FIRST_HALF.TOTAL_ORDER DESC;