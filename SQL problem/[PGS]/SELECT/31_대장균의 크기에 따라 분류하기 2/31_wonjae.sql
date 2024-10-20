SELECT
    ID,
    -- NTILE ([그룹으로 나눌 정수]) OVER (PARTITION BY [컬럼1] ORDER BY [컬럼2] DESC/ASC)
    -- 정수만큼 그룹을 만들어서 등급마다 번호를 부여
    -- PARTITION BY를 사용하면 컬럼1을 기준으로 그룹화
    -- ORDER BY를 사용하면 컬럼2를 기준으로 정렬
    CASE WHEN NTILE (4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 1 THEN 'CRITICAL'
        WHEN NTILE (4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 2 THEN 'HIGH'
        WHEN NTILE (4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 3 THEN 'MEDIUM'
        WHEN NTILE (4) OVER (ORDER BY SIZE_OF_COLONY DESC) = 4 THEN 'LOW'
        END AS 'COLONY_NAME'
FROM
    ECOLI_DATA
ORDER BY
    -- ID를 기준으로 오름차순 정렬
    ID ASC;