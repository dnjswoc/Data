SELECT
    -- 처음에는 CASE WHEN과 MONTH 함수를 사용해서 조건별로 분기를 구해주었지만
    -- CASE WHEN MONTH(DIFFERENTIATION_DATE) IN (1, 2, 3) THEN '1Q'
    --     WHEN MONTH(DIFFERENTIATION_DATE) IN (4, 5, 6) THEN '2Q'
    --     WHEN MONTH(DIFFERENTIATION_DATE) IN (7, 8, 9) THEN '3Q'
    --     ELSE '4Q'
    --     END AS 'QUARTER',
    -- QUARTER 함수를 사용하면 쉽게 분기를 구할 수 있고, CONCAT을 사용하여 분기 뒤에 Q를 합쳐주었다
    CONCAT(QUARTER(DIFFERENTIATION_DATE), 'Q') AS 'QUARTER',
    COUNT(ID) AS 'ECOLI_COUNT'
FROM
    ECOLI_DATA
GROUP BY
    -- 분기 별로 분화된 대장균 수를 구하기 위해 그룹화
    QUARTER
ORDER BY
    -- 분기를 기준으로 오름차순 정렬
    QUARTER ASC;