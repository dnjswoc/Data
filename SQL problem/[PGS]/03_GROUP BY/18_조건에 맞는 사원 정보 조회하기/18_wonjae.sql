SELECT
    SUM(g.SCORE) AS 'SCORE',
    g.EMP_NO,
    e.EMP_NAME,
    e.POSITION,
    e.EMAIL
FROM
    HR_EMPLOYEES e
JOIN
    HR_GRADE g
ON
    e.EMP_NO = g.EMP_NO
GROUP BY
    -- 사번을 그룹화
    g.EMP_NO
ORDER BY
    -- 점수 합이 가장 높은 사람을 찾기 위해 내림차순
    SUM(g.SCORE) DESC
LIMIT
    -- 내림차순 후 1개의 데이터만 추출
    1;