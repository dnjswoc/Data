-- Manhattan 거리 구하기
-- 두 점 P(a, b), Q(c, d)가 있을 때 맨하탄 거리는
-- |a - c| + |b - d|
SELECT
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM
    STATION;