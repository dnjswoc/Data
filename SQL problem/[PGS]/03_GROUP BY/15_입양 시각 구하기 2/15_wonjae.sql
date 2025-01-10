-- WITH RECURSIVE : 재귀를 사용하여 가상의 테이블 만들기
-- RECURSIVE를 사용할 때, 반복하지 않는 문장이 하나 필요하고(SELECT 0 AS 'HOUR')
-- UNION이 반드시 필요!
-- 자신의 가상 테이블을 참조하는 문장이 필요하고, 정지 조건이 필요하다
WITH RECURSIVE TIME_TB AS (
    SELECT
        0 AS 'HOUR'
    UNION ALL
    SELECT
        HOUR + 1
    FROM
        TIME_TB
    WHERE
        HOUR < 23
)
SELECT
    t.HOUR,
    COUNT(o.ANIMAL_ID) AS 'COUNT'
FROM
    TIME_TB t
LEFT JOIN
    ANIMAL_OUTS o
ON
    t.HOUR = HOUR(O.DATETIME)
GROUP BY
    t.HOUR
ORDER BY
    -- HOUR 기준으로 오름차순 정렬
    t.HOUR ASC;