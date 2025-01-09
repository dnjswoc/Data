SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    -- REGEXP를 사용하여 특정 단어로 끝나는 데이터 조회
    CITY REGEXP ('A$|E$|I$|O$|U$');