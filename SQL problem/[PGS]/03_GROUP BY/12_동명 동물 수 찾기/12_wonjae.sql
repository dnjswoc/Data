SELECT
    NAME,
    COUNT(*) AS 'COUNT'
FROM
    ANIMAL_INS
WHERE
    -- 이름이 없는 동물은 제외
    NAME IS NOT NULL
GROUP BY
    NAME
HAVING
    -- 2번 이상 쓰인 이름 추출
    COUNT > 1
ORDER BY
    -- 이름순으로 정렬
    NAME ASC;