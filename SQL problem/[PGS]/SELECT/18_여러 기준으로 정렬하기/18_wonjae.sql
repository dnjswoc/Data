SELECT
    ANIMAL_ID, NAME, DATETIME
FROM
    ANIMAL_INS
ORDER BY
    -- 이름 순으로 조회
    NAME ASC,
    -- 이름이 같다면 보호 시작일이 늦은 순으로 조회
    DATETIME DESC;