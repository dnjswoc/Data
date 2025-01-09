SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    -- 모음으로 시작하고, 모음으로 끝나는 데이터 조회회
    CITY REGEXP ('^A|^E|^I|^O|^U') AND
    CITY REGEXP ('A$|E$|I$|O$|U$');