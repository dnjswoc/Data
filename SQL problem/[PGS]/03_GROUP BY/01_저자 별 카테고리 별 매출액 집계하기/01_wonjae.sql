SELECT
    b.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    SUM(s.SALES) AS 'TOTAL_SALES'
FROM
    BOOK b
JOIN
    AUTHOR a
ON
    -- 저자 이름을 SELECT하기 위해 JOIN
    b.AUTHOR_ID = a.AUTHOR_ID
JOIN
    -- 2022년 1월에 판매된 BOOK_ID 별 책 매출액을 구한 테이블블과 JOIN
    (SELECT
        sa.BOOK_ID,
        SUM(sa.SALES) * bo.PRICE AS 'SALES'
    FROM
        BOOK_SALES sa
    JOIN
        BOOK bo
    ON
        sa.BOOK_ID = bo.BOOK_ID
    WHERE
        sa.SALES_DATE LIKE '2022-01%'
    GROUP BY
        bo.BOOK_ID) s
ON
    b.BOOK_ID = s.BOOK_ID
GROUP BY
    -- 저자 별, 카테고리 별 매출액을 구하기 위해 그룹화
    a.AUTHOR_ID,
    b.CATEGORY
ORDER BY
    -- 저자 이름 기준 오름차순, 카테고리 기준 내림차순 정렬
    a.AUTHOR_ID ASC,
    b.CATEGORY DESC;