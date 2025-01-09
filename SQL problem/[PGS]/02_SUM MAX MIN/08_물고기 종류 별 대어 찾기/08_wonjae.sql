SELECT
    i.ID,
    n.FISH_NAME,
    i.LENGTH
FROM
    FISH_INFO i
JOIN
    FISH_NAME_INFO n
ON
    i.FISH_TYPE = n.FISH_TYPE
WHERE
    -- 물고기 종류별 최대 길이에 해당하는 데이터 조회회
    (i.FISH_TYPE, i.LENGTH) IN (
        SELECT
            FISH_TYPE,
            MAX(LENGTH)
        FROM
            FISH_INFO
        GROUP BY
            FISH_TYPE
    )
ORDER BY
    -- ID 기준 오름차순 정렬
    i.ID ASC;