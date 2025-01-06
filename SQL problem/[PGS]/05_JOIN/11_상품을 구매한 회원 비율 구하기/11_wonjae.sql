SELECT
    YEAR(SALES_DATE) AS 'YEAR',
    MONTH(SALES_DATE) AS 'MONTH',
    COUNT(DISTINCT USER_ID) AS 'PURCHASED_USERS',
    -- 서브쿼리를 사용하여 2021년에 회원 가입한 USER의 수를 구한다
    ROUND(COUNT(DISTINCT USER_ID)/(SELECT COUNT(USER_ID) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS 'PURCHASED_RATIO'
FROM
    ONLINE_SALE
WHERE
    -- 서브쿼리를 사용하여 2021년에 가입한 USER 대상으로만 구매한 정보를 조회한다
    USER_ID IN (
        SELECT
            USER_ID
        FROM
            USER_INFO
        WHERE
            YEAR(JOINED) = 2021
    )
GROUP BY
    YEAR,
    MONTH
ORDER BY
    YEAR ASC,
    MONTH ASC;

-- GPT에 효율적인 쿼리를 부탁한 결과 CROSS JOIN과 WITH 절을 사용하는 두 가지 방법이 나왔다
-- CROSS JOIN을 사용하면 cartesian product가 행해지는데 이 문제에서는 CROSS JOIN할 값이
-- 2021년 가입자 수인 1개의 행만 반환하므로 메인 쿼리의 행의 개수는 변하지 않으면서
-- CROSS JOIN에서 사용할 2021년 가입자 수만 따로 넘겨줄 수 있게 되는 것이다.