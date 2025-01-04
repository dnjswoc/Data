SELECT
    ANIMAL_ID
FROM
    ANIMAL_INS
WHERE
    -- 이름이 있는 동물(NAME값이 NULL이 아닌)을 조회
    NAME IS NOT NULL
ORDER BY
    -- ANIMAL_ID 기준으로 오름차순 정렬
    ANIMAL_ID ASC;