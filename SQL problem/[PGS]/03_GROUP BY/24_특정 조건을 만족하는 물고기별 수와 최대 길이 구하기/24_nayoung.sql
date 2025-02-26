SELECT
    COUNT(*) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,
    FISH_TYPE
FROM
    (SELECT
        FISH_TYPE,
        -- 10CM이하의 물고기들은 10cm로 표기기하기 위해 CASE WHEN THEN문 사용용
        CASE WHEN
            LENGTH IS NULL THEN 10,
            ELSE LENGTH
        END AS LENGTH) AS AA
GROUP BY
    FISH_TYPE
-- 그룹별 조건문 생성성
HAVING
    AVG(LENGTH) >= 33
ORDER BY
    FISH_TYPE;