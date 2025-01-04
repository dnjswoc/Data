-- 풀이 1
SELECT
    COUNT(*) AS 'FISH_COUNT',
    MAX(LENGTH) AS 'MAX_LENGTH',
    FISH_TYPE
FROM
    FISH_INFO
WHERE
    -- IFNULL을 사용하여 LENGTH에 존재하는 NULL 값을 10으로 대체해준 후 계산
    -- 그 결과 정답 처리는 되었지만, 채점 케이스 6개 중 2개가 틀렸다고 나왔다
    IFNULL(LENGTH, 10)
GROUP BY
    FISH_TYPE
HAVING
    AVG(LENGTH) >= 33
ORDER BY
    FISH_TYPE;


-- 풀이 2 FROM 절 내 Subquery
SELECT
    COUNT(*) AS 'FISH_COUNT',
    MAX(LENGTH) AS 'MAX_LENGTH',
    FISH_TYPE
FROM
    -- 서브쿼리를 사용하여 LENGTH를 변환한 테이블에서 조회
    (SELECT
        ID,
        FISH_TYPE,
        CASE WHEN LENGTH IS NULL THEN 10
            ELSE LENGTH
        END AS 'LENGTH'
    FROM
        FISH_INFO
    ) F
GROUP BY
    FISH_TYPE
HAVING
    AVG(LENGTH) >= 33
ORDER BY
    FISH_TYPE;


-- 풀이 3
WITH LENGTH_TB AS (
    -- WITH를 사용하여 LENGTH에 존재하는 NULL 값을 10으로 대체한 가상의 테이블을 만든다.
    SELECT
        FISH_TYPE,
        CASE WHEN LENGTH IS NULL THEN 10
            ELSE LENGTH
        END AS 'LENGTH'
    FROM
        FISH_INFO
)
SELECT
    COUNT(*) AS 'FISH_COUNT',
    MAX(LENGTH) AS 'MAX_LENGTH',
    FISH_TYPE
FROM
    -- WITH로 만든 가상 테이블로 값을 조회
    LENGTH_TB
GROUP BY
    FISH_TYPE
HAVING
    AVG(LENGTH) >= 33
ORDER BY
    FISH_TYPE;