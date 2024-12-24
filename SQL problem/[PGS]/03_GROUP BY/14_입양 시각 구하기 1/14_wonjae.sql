SELECT
    -- HOUR : 입양 시각 추출
    HOUR(DATETIME) AS 'HOUR',
    COUNT(ANIMAL_ID) AS 'COUNT'
FROM
    ANIMAL_OUTS
GROUP BY
    HOUR
HAVING
    -- 9시부터 19:59분 사이의 데이터 추출
    HOUR BETWEEN 9 AND 19
ORDER BY
    HOUR;