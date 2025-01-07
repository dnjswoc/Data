SELECT
    ANIMAL_ID,
    NAME,
    -- Neutered나 Spayed가 들어가는 동물은 중성화가 되었다
    CASE WHEN SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O'
        ELSE 'X'
        END AS '중성화'
FROM
    ANIMAL_INS
ORDER BY
    -- ANIMAL_ID 기준 오름차순 정렬
    ANIMAL_ID ASC;