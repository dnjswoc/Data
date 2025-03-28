SELECT
    COUNT(*) AS 'FISH_COUNT'
FROM
    FISH_INFO f
JOIN
    FISH_NAME_INFO n
ON
    f.FISH_TYPE = n.FISH_TYPE
WHERE
    -- 잡은 물고기가 BASS와 SNAPPER인 물고기 수 조회
    n.FISH_NAME IN ('BASS', 'SNAPPER');