SELECT
    i.ANIMAL_ID,
    i.ANIMAL_TYPE,
    i.NAME
FROM
    ANIMAL_INS i
JOIN
    ANIMAL_OUTS o
ON
    i.ANIMAL_ID = o.ANIMAL_ID
WHERE
    -- 보호소에 들어왔을 때와 나갈 때 중성화 여부가 달라진 데이터 조회
    i.SEX_UPON_INTAKE != o.SEX_UPON_OUTCOME
ORDER BY
    -- ANIMAL_ID 기준으로 오름차순 정렬
    i.ANIMAL_ID ASC;