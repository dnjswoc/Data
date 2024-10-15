SELECT
    BOOK_ID, 
    DATE_FORMAT(published_date,'%Y-%m-%d') AS PUBLISHED_DATE
FROM
    BOOK
WHERE 
    CATEGORY = '인문'
    AND
    -- 출판일이 2021년도 인걸 가져오기 위해 DATE_FORMAT사용하여 연도만 뽑아옴
    DATE_FORMAT(PUBLISHED_DATE,'%Y') = '2021'
ORDER BY
    published_date;