SELECT
    AVG(POPULATION)
FROM
    CITY
WHERE
    -- 캘리포니아의 평균 인구 조회
    DISTRICT = 'California';