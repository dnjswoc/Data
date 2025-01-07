SELECT
    i.ANIMAL_ID,
    i.NAME
FROM
    ANIMAL_INS i
    -- 입양 나간 동물 중에서 고르므로 INNER JOIN을 사용
JOIN
    ANIMAL_OUTS o
ON
    i.ANIMAL_ID = o.ANIMAL_ID
ORDER BY
    -- 보호 기간이 가장 오래된 2마리 데이터 조회
    DATEDIFF(o.DATETIME, i.DATETIME) DESC
LIMIT
    2;