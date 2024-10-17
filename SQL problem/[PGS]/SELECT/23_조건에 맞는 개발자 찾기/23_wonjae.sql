SELECT
    ID, EMAIL, FIRST_NAME, LAST_NAME
FROM
    DEVELOPERS
WHERE
    -- DEVELOPERS 테이블의 SKILL_CODE와 C#의 SKILLCODES를 비트 연산하여
    -- 0 이상이 나오면 C# 기술을 가지고 있다.
    SKILL_CODE & (
    SELECT
      CODE
    FROM
      SKILLCODES
    WHERE
      NAME = 'C#') > 0
    -- DEVELOPERS 테이블의 SKILL_CODE와 Python의 SKILLCODES를 비트 연산하여
    -- 0 이상이 나오면 Python 기술을 가지고 있다.
    OR SKILL_CODE & (
    SELECT
      CODE
    FROM
      SKILLCODES
    WHERE
      NAME = 'Python') > 0
ORDER BY
    ID ASC;