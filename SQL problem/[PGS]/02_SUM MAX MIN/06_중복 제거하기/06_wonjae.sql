SELECT
    -- NULL값과 중복을 제외한 동물 이름의 개수를 구하기 위해
    -- DISTINCT NAME에 COUNT를 활용했다.
    COUNT(DISTINCT NAME) AS 'count'
FROM
    ANIMAL_INS;