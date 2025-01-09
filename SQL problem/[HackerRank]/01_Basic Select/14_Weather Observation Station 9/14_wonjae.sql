SELECT
    -- 중복 값 제거
    DISTINCT CITY
FROM
    STATION
WHERE
    -- 모음으로 시작하지 않는 데이터 조회
    CITY NOT REGEXP ('^A|^E|^I|^O|^U');