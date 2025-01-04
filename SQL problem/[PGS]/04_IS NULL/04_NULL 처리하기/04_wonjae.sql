-- 코드를 입력하세요
SELECT
    ANIMAL_TYPE,
    -- CASE WHEN을 사용하여 NAME이 NULL인 경우 값을 No name으로 변경
    CASE WHEN NAME IS NULL THEN 'No name'
        ELSE NAME
        END AS 'NAME',
    SEX_UPON_INTAKE
FROM
    ANIMAL_INS