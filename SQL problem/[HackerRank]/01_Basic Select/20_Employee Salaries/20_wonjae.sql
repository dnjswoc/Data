SELECT
    NAME
FROM
    EMPLOYEE
WHERE
    -- SALARY가 $2000 이하이고, MONTHS가 10개월 미만인 데이터 조회
    SALARY > 2000 AND
    MONTHS < 10
ORDER BY
    -- ID 기준으로 오름차순 정렬
    EMPLOYEE_ID ASC;