SELECT
    --  YEAR : 연도를 추출, MONTH : 월을 추출
    -- 처음에 DATE_FORMAT으로 연도와 월을 추출했는데 계속 오답으로 처리됨
    -- DATE_FORMAT과 YEAR, MONTH와 같은 날짜/시간 함수는 반환값의 차이가 있다.
    -- DATE_FORMAT : VARCHAR 반환, YEAR, MONTH : 숫자로 반환
    YEAR(o.SALES_DATE) AS 'YEAR',
    MONTH(o.SALES_DATE) AS 'MONTH',
    u.GENDER,
    COUNT(DISTINCT u.USER_ID) AS 'USERS'
FROM
    ONLINE_SALE o
JOIN
    USER_INFO u
ON
    o.USER_ID = u.USER_ID
WHERE
    u.GENDER IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    GENDER
ORDER BY
    YEAR,
    MONTH,
    GENDER;