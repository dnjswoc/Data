-- 보호소에 가장 오래 있었던 동물을 구하기 위해
-- ANIMAL_INS 테이블과 ANIMAL_OUTS 테이블을 LEFT OUTER JOIN 후
-- ANIMAL_OUTS 테이블에는 DATETIME이 존재하지 않고,
-- ANIMAL_INS 테이블에는 DATETIME이 가장 오래된 데이터 조회
SELECT
    i.NAME,
    i.DATETIME
FROM
    ANIMAL_INS i
LEFT OUTER JOIN
    ANIMAL_OUTS o
ON
    i.ANIMAL_ID = o.ANIMAL_ID
WHERE
    o.DATETIME IS NULL
ORDER BY
    i.DATETIME ASC
LIMIT
    3;