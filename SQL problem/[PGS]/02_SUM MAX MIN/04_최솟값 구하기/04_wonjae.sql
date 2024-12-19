SELECT
    DATETIME
FROM
    ANIMAL_INS
ORDER BY
    -- 가장 오래된 시간을 구하기 위해 DATETIME 오름차순 후 1개 데이터 추출
    DATETIME ASC
LIMIT
    1;