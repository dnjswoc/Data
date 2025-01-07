SELECT
    ANIMAL_ID,
    NAME
FROM
    ANIMAL_INS
WHERE
    -- 이름에 el이 들어가고
    NAME LIKE '%EL%' AND
    -- 동물 종류가 Dog인 데이터 조회
    ANIMAL_TYPE = 'Dog'
ORDER BY
    -- 이름 기준 오름차순 정렬
    NAME ASC;