SELECT
    f.FLAVOR
FROM
    FIRST_HALF f
JOIN
    -- subquery를 사용해서 FLAVOR 별로 총 주문량을 합친 테이블을 만듦
    (SELECT
        FLAVOR,
        SUM(TOTAL_ORDER) AS 'TOTAL_ORDER'
     FROM
        JULY
     GROUP BY
        FLAVOR
    ) j
ON
    f.FLAVOR = j.FLAVOR
ORDER BY
    -- 상반기 총 주문량과 7월 총 주문량 합이 가장 높은 3개의 데이터 추출
    f.TOTAL_ORDER + j.TOTAL_ORDER DESC
LIMIT
    3;