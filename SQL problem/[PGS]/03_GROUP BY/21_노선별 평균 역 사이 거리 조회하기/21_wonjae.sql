SELECT
    ROUTE,
    -- CONCAT : 문자열 합치기
    -- ROUND : 반올림, 뒤에 나오는 숫자로 반올림
    CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS 'TOTAL_DISTANCE',
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS 'AVERAGE_DISTANCE'
FROM
    SUBWAY_DISTANCE
GROUP BY
    ROUTE
ORDER BY
    -- 처음에 TOTAL_DISTANCE를 기준으로 내림차순을 했지만 오답이 되었다
    -- TOTAL_DISTANCE는 반올림 한 숫자를 문자열로 변환한 것이므로 문자열 기준으로 정렬이 된다
    -- 문자열 기준으로 정렬되므로 120km가 99km보다 뒤에 올 수 있다
    -- 따라서 숫자를 기준으로 정렬해야 하므로 SUM(D_BETWEEN_DIST)을 기준으로 정렬해야 한다
    SUM(D_BETWEEN_DIST) DESC;