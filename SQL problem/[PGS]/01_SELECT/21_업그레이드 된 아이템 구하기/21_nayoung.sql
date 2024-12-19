SELECT
    INFO.ITEM_ID, INFO.ITEM_NAME, INFO.RARITY
FROM 
    ITEM_INFO INFO
JOIN 
    ITEM_TREE TREE
ON 
    INFO.ITEM_ID = TREE.ITEM_ID
WHERE 
    # null은 Root를 의미
    TREE.PARENT_ITEM_ID IN (
      # 'RARE'인 것만 ID 뽑아온 서브쿼리
        SELECT 
            ITEM_ID
        FROM
            ITEM_INFO
        WHERE
            RARITY = 'RARE')
ORDER BY
    INFO.ITEM_ID DESC;
    