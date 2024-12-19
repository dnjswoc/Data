SELECT 
    ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM
    DEVELOPER_INFOS
WHERE
    --  스킬 3개의 필드중에 파이썬이 어디 들어갈지 모르니 IN 조건문 작성
    'Python' IN (SKILL_1, SKILL_2, SKILL_3)
ORDER BY
    ID;