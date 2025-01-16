SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE
    -- 일본 전체 총 인구 수 조회
    COUNTRYCODE = 'JPN';