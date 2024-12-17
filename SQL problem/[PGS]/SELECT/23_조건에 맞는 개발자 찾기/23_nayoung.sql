SELECT
    ID, EMAIL, FIRST_NAME, LAST_NAME
FROM
    DEVELOPERS
WHERE
    # 비트 연산자인 ‘&’는 AND 연산자를 의미하며, 
    # 대응되는 비트가 모두 1이면 1을 반환해 준다. 
    # 즉, 0이 아닌 값들을 반환해 주는 것은 
    # 한 개 이상의 기술 비트가 포함되어 있다는 것을 알 수 있다.
    SKILL_CODE &
    (SELECT
        CODE
    FROM
        SKILLCODES
    WHERE NAME='C#')
    OR
    SKILL_CODE &
    (SELECT
        CODE
    FROM
        SKILLCODES
    WHERE
        NAME='Python')
ORDER BY
    ID;