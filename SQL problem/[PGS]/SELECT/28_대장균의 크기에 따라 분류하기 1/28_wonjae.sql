SELECT
    ID,
    -- 대장균의 크기가 100 이하라면 'LOW'
    CASE WHEN SIZE_OF_COLONY <= 100 THEN 'LOW'
    -- 100 초과 1000 이하라면 'MEDIUM'
        WHEN SIZE_OF_COLONY > 100 AND SIZE_OF_COLONY <= 1000 THEN 'MEDIUM'
    -- 1000 초과라면 'HIGH'
        WHEN SIZE_OF_COLONY > 1000 THEN 'HIGH'
        -- 이름은 SIZE
        END AS 'SIZE'
FROM
    ECOLI_DATA
ORDER BY
    -- ID를 기준으로 오름차순 정렬
    ID ASC;