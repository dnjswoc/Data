SELECT
    ANIMAL_ID,
    NAME,
    -- YYYY-MM-DD 형식으로 변경
    DATE_FORMAT(DATETIME, '%Y-%m-%d') AS '날짜'
FROM
    ANIMAL_INS
ORDER BY
    -- ANIMAL_ID 기준 오름차순 정렬
    ANIMAL_ID ASC;