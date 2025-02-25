-- 가장 높은 연봉을 구하고, 그에 해당하는 연봉을 받는 직원의 수를 구하는 문제

-- 내 풀이
SELECT
    EARNINGS,
    COUNT(*)
FROM
    -- 최대 연봉을 받는 사람의 수를 구하기 위한 서브쿼리
    (
    SELECT
        EMPLOYEE_ID,
        MONTHS * SALARY AS EARNINGS
    FROM
        EMPLOYEE
    WHERE
        -- 최대 연봉을 구하기 위한 서브쿼리
        MONTHS * SALARY = (
        SELECT
            MONTHS * SALARY AS EARNINGS
        FROM
            EMPLOYEE
        ORDER BY
            EARNINGS DESC
        LIMIT
            1)
    ) e1
GROUP BY
    -- GROUP BY를 통해 직원의 수를 구한다.
    EARNINGS;


-- Hackerrank에서 본 다른 사람의 풀이
SELECT
    MAX(MONTHS * SALARY),
    COUNT(*)
FROM
    EMPLOYEE
WHERE
    (MONTHS * SALARY) = (
    SELECT
        MAX(MONTHS * SALARY)
    FROM
        EMPLOYEE
    );


-- 내 풀이는 불필요한 서브쿼리도 있어 성능면에서도 좋지 않고, 코드도 길어서 가독성이 떨어지는 반면
-- 다른 사람의 풀이는 내 풀이에 비해 가독성도 뛰어나며 ORDER BY를 사용하지 않아 정렬이 필요하지 않아서 성능면에서도 좋다.