SELECT
    COUNT(ID)
FROM
    CITY
WHERE
    -- 인구가 10만 이상인 도시 조회
    POPULATION >= 100000;