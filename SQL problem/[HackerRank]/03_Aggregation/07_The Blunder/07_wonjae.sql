SELECT
    -- CEIL : 소수점 이하 올림
    -- REPLACE : 문자열 치환환
    CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, 0, '')))
FROM
    EMPLOYEES;