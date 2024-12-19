-- 동물 보호소에 가장 먼저 들어온 동물의 이름 조회
SELECT
    NAME
FROM
    ANIMAL_INS
ORDER BY
    -- 보호 시작일이 빠른 순으로 조회 후
    DATETIME ASC
LIMIT
    -- 데이터 1개만 가져오기
    1;