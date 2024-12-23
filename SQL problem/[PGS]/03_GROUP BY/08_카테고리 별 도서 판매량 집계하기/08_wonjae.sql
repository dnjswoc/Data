SELECT
    b.CATEGORY,
    -- 카테고리 별 도서 총 판매량 조회
    SUM(s.SALES) AS 'TOTAL_SALES'
FROM
    BOOK b
JOIN
    BOOK_SALES s
ON
    b.BOOK_ID = s.BOOK_ID
WHERE
    -- 판매일이 2022년 01월인 데이터 조회
    DATE_FORMAT(s.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY
    -- 카테고리 별 그룹화
    b.CATEGORY
ORDER BY
    b.CATEGORY;