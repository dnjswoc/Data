-- 소수점 둘째 자리로 반올림 계산
SELECT
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM
    STATION;