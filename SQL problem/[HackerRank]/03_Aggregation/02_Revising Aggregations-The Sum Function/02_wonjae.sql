SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE
    -- 캘리포니아의 전체 인구 조회
    DISTRICT = 'California';