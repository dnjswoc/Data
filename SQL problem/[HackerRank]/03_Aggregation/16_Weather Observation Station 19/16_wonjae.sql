-- EUCLIDEAN 거리
-- 두 점 P(a, b), Q(c, d)가 있을 때 유클리디안 거리는
-- sqrt((a - c)^2 + (b - d)^2)
SELECT
    ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM
    STATION;