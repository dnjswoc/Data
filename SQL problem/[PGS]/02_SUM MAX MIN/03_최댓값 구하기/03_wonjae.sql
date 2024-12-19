SELECT
    DATETIME
FROM
    ANIMAL_INS
ORDER BY
    -- 가장 최근의 시간을 조회하기 위해 DATETIME 내림차순 후 1개 데이터 추출
    DATETIME DESC
LIMIT
    1;