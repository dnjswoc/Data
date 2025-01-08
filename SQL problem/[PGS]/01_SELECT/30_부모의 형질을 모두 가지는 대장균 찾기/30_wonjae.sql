SELECT
    e1.ID,
    e1.GENOTYPE,
    e2.GENOTYPE AS 'PARENT_GENOTYPE'
FROM
    ECOLI_DATA e1
LEFT JOIN
    ECOLI_DATA e2
ON
    -- 자식 대장균과 부모 대장균의 형질을 비교하기 위해 LEFT JOIN
    e1.PARENT_ID = e2.ID
WHERE
    -- 부모 대장균이 없는 경우를 제외
    e1.PARENT_ID IS NOT NULL AND
    -- 부모의 형질을 모두 포함해야 하므로 & 비트 연산 사용
    e1.GENOTYPE & e2.GENOTYPE = e2.GENOTYPE
ORDER BY
    -- ID 기준 오름차순 정렬
    e1.ID ASC;