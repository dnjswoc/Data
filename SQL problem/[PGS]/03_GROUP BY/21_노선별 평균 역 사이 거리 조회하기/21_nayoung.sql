SELECT  
    ROUTE,
    CONCAT(ROUND(SUM(D_BETWEEN_DIST),1),'km') AS TOTAL_DISTANCE,
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM
    SUBWAY_DISTANCE
GROUP BY
    ROUTE
ORDER BY
    # TOTAL_DISTANCE로 정렬하면 문자열로 인식해서 답이 다르게 나올 수 있으므로 숫자로 정렬
    SUM(D_BETWEEN_DIST) DESC;