SELECT
    COUNT(*) AS 'FISH_COUNT',
    n.FISH_NAME
FROM
    FISH_INFO i
JOIN
    FISH_NAME_INFO n
ON
    i.FISH_TYPE = n.FISH_TYPE
GROUP BY
    -- 처음에는 n.FISH_TYPE으로 그룹화했지만 그렇게 하면 n.FISH_NAME을 SELECT할 수 없어서
    -- n.FISH_NAME으로 그룹화 수행(n.FISH_NAME은 nonaggregate하므로)
    n.FISH_NAME
ORDER BY
    FISH_COUNT DESC;