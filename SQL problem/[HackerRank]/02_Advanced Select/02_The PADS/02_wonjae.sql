SELECT
    -- LEFT를 사용하여 직업의 맨 앞글자를 가져온다
    CONCAT(NAME, '(', LEFT(OCCUPATION, 1), ')')
FROM
    OCCUPATIONS
ORDER BY
    -- 이름순으로 정렬
    NAME ASC;
    
SELECT
    -- 직업 별 종사자 수를 구하고 LOWER를 사용하여 소문자로 변환
    CONCAT('There are a total of ', COUNT(NAME), ' ', LOWER(OCCUPATION), 's.')
FROM
    OCCUPATIONS
GROUP BY
    OCCUPATION
ORDER BY
    -- 종사자 수 기준으로 오름차순 정렬
    COUNT(NAME) ASC;