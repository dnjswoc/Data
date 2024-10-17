SELECT
    ID, LENGTH
FROM
    FISH_INFO
ORDER BY
    -- 길이를 기준으로 내림차순, 길이가 같다면 ID를 기준으로 오름차순
    LENGTH DESC,
    ID ASC
LIMIT
    -- 길이가 가장 긴 10마리를 조회
    10;