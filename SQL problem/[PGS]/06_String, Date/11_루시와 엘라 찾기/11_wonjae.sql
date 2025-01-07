SELECT
    ANIMAL_ID,
    NAME,
    SEX_UPON_INTAKE
FROM
    ANIMAL_INS
WHERE
    NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY
    -- ANIMAL_ID 기준 오름차순 정렬렬
    ANIMAL_ID ASC;