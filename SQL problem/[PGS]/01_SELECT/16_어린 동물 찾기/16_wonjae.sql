SELECT
    ANIMAL_ID, NAME
FROM
    ANIMAL_INS
WHERE
    -- 젊은 동물(INTAKE_CONDITION이 Aged가 아닌) 조회
    INTAKE_CONDITION != 'Aged'
ORDER BY
    -- 아이디 순으로 조회
    ANIMAL_ID ASC;