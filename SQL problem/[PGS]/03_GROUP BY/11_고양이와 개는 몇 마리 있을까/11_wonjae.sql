SELECT
    ANIMAL_TYPE,
    COUNT(*) AS 'count'
FROM
    ANIMAL_INS
GROUP BY
    -- 개와 고양이 그룹화
    ANIMAL_TYPE
ORDER BY
    -- 고양이(CAT)이 개(DOG)보다 먼저 와야하므로 오름차순 정렬
    ANIMAL_TYPE ASC;