SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    -- LIKE와 OR로 문제를 쉽게 풀 수 있었고,
    -- CITY LIKE 'A%' OR
    -- CITY LIKE 'E%' OR
    -- CITY LIKE 'I%' OR
    -- CITY LIKE 'O%' OR
    -- CITY LIKE 'U%'
    -- REGEXP로 여러 문자를 포함하는 값을 쉽게 구할 수 있었다
    -- REGEXP ('문자|문자|문자')
    -- ^ : 시작하는 단어, $ : 끝나는 단어
    CITY REGEXP ('^A|^E|^I|^O|^U');