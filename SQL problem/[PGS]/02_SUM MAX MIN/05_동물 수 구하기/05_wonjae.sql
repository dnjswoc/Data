SELECT
    -- 동물 보호소에 있는 동물의 수를 구하기 위해
    -- COUNT를 사용해 ANIMAL_ID의 개수를 구한다.
    COUNT(ANIMAL_ID) AS 'count'
FROM
    ANIMAL_INS;