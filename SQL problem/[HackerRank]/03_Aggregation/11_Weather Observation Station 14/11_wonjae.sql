-- 북반구 위도가 137.2345 이하의 최댓값(소수 넷째 자리 이하 버림)
SELECT
    TRUNCATE(MAX(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N < 137.2345;