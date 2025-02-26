SELECT
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    -- LAT_N이 38.7780보다 큰 값 조건 걸어주기
    LAT_N > 38.7780;