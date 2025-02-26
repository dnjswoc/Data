-- LAT_N이 가장 큰 값의 LONG_w 값 구하기
SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    -- 서브쿼리를 사용해 LAT_N의 최댓값인 데이터 조건 걸어주기
    LAT_N = (
    SELECT
        MAX(LAT_N)
    FROM
        STATION
    WHERE
        LAT_N < 137.2345
    );