-- WITH를 사용하여 LENGTH가 10cm 이하인 데이터를 10으로 변경한 가상의 테이블 생성
WITH LENGTH_TB AS (
    SELECT
        ID,
        FISH_TYPE,
        -- LENGTH가 10cm 이하면 NULL로 표시됨
        -- CASE WHEN을 사용하여 데이터 변경
        CASE WHEN LENGTH IS NULL THEN 10
            ELSE LENGTH
            END AS 'LENGTH',
        TIME
    FROM
        FISH_INFO
)
SELECT
    -- ROUND(DATA, NUM) : DATA를 소수 NUM번째 자리로 반올림
    ROUND(AVG(LENGTH), 2) AS 'AVERAGE_LENGTH'
FROM
    LENGTH_TB;