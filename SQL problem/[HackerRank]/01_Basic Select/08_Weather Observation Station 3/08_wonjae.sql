SELECT
    -- DISTINCT로 중복 값 제거
    DISTINCT CITY
FROM
    STATION
WHERE
    -- ID가 짝수인 데이터 조회
    ID % 2 = 0;