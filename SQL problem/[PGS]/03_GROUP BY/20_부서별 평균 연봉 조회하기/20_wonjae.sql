SELECT
    d.DEPT_ID,
    d.DEPT_NAME_EN,
    -- 연봉 평균을 구하고 소수 첫째 자리에서 반올림
    ROUND(AVG(e.SAL)) AS 'AVG_SAL'
FROM
    HR_DEPARTMENT d
JOIN
    HR_EMPLOYEES e
ON
    d.DEPT_ID = e.DEPT_ID
GROUP BY
    e.DEPT_ID
ORDER BY
    -- 평균 연봉 내림차순 정렬
    AVG_SAL DESC;