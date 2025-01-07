SELECT
    YEAR(YM) AS 'YEAR',
    -- 미세먼지, 초미세먼지의 평균 값을 구하고 소수 셋째 자리에서 반올림
    ROUND(AVG(PM_VAL1), 2) AS 'PM10',
    ROUND(AVG(PM_VAL2), 2) AS 'PM2.5'
FROM
    AIR_POLLUTION
WHERE
    LOCATION2 = '수원'
GROUP BY
    -- 연도별 평균 값을 구하기 위해 그룹화
    YEAR(YM)
ORDER BY
    -- 연도 기준 오름차순 정렬
    YEAR ASC;