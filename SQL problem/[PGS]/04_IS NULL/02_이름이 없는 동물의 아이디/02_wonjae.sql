SELECT
    ANIMAL_ID
FROM
    ANIMAL_INS
WHERE
    -- 이름이 없는 채로 들어온 동물(NAME값이 NULL)을 선택
    NAME IS NULL
ORDER BY
    -- ANIMAL_ID 기준으로 오름차순 정렬
    ANIMAL_ID ASC;