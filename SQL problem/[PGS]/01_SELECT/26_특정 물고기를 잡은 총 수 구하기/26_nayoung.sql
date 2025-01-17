SELECT
    COUNT(*) AS FISH_COUNT
FROM
    FISH_INFO INFO
JOIN
    -- 잡은 물고기이 NAME 가져와야하니 JOIN사용
    FISH_NAME_INFO NAME
ON
    INFO.FISH_TYPE = NAME.FISH_TYPE
WHERE
    -- IN 사용하여 조건문 설정
    NAME.FISH_NAME IN ('BASS','SNAPPER');