SELECT
    DR_NAME, 
    DR_ID, 
    MCDP_CD,
    -- 날짜 포맷 함수(my_sql용 함수)
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS 'HIRE_YMD'
FROM
    DOCTOR
WHERE
    MCDP_CD IN ('CS','GS')
ORDER BY
    HIRE_YMD DESC,
    DR_NAME;