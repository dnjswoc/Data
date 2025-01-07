SELECT
    COUNT(*) AS 'FISH_COUNT'
FROM
    FISH_INFO
WHERE
    -- 2021년에 잡은 물고기 수를 구하기 위해 그룹화
    YEAR(TIME) = 2021;