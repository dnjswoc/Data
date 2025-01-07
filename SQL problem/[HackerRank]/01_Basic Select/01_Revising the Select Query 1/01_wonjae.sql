SELECT
    -- 모든 컬럼 조회
    *
FROM
    CITY
WHERE
    -- 인구가 10만이 넘고, 국가 코드가 USA인 데이터 조회
    POPULATION >= 100000 AND
    COUNTRYCODE = 'USA';