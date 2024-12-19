SELECT
    i.ITEM_ID, i.ITEM_NAME, i.RARITY
FROM
    ITEM_INFO i
JOIN
    ITEM_TREE t
ON
-- ITEM_ID를 기준으로 JOIN
    t.ITEM_ID = i.ITEM_ID
WHERE
    -- PARENT_ITEM_ID가 NULL이 아니어야 업그레이드 가능한 것이고,
    -- 아이템의 희귀도(RARITY)가 'RARE'여야 한다.
    t.PARENT_ITEM_ID IN (
    SELECT
        ITEM_ID
    FROM
        ITEM_INFO
    WHERE
        RARITY = 'RARE'
    )
ORDER BY
    -- ITEM_ID를 기준으로 내림차순 정렬
    i.ITEM_ID DESC;