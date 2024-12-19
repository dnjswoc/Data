SELECT
    -- CONCAT : 문자열 합칠 때 사용(ex. 50.00cm로 나오려면 CONCAT(50.00, 'cm'))
    CONCAT(MAX(LENGTH), 'cm') AS 'MAX_LENGTH'
FROM
    FISH_INFO;