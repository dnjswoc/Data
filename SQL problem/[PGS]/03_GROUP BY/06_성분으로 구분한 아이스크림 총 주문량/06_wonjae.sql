SELECT
    i.INGREDIENT_TYPE,
    -- 총 주문량 조회
    SUM(f.TOTAL_ORDER) AS 'TOTAL_ORDER'
FROM
    FIRST_HALF f
JOIN
    ICECREAM_INFO i
ON
    f.FLAVOR = i.FLAVOR
GROUP BY
    -- 아이스크림 성분 타입 별 그룹화
    INGREDIENT_TYPE;