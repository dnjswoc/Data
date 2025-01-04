```
ITEM_ID가 PARENT_ITEM_ID에 없다면 부모 아이템에 해당하지 않으므로
더 이상 업그레이드 할 수 없다고 판단할 수 있다.
```
SELECT
    ITEM_ID,
    ITEM_NAME,
    RARITY
FROM
    ITEM_INFO
WHERE
    -- PARENT_ITEM_ID에 존재하지 않는 ITEM_ID를 조회
    ITEM_ID NOT IN (
    SELECT
        -- 하나의 값만 필요하기 때문에 DISTICNT 사용
        DISTINCT PARENT_ITEM_ID
    FROM
        ITEM_TREE
    WHERE
        -- NULL 값은 제외
        PARENT_ITEM_ID IS NOT NULL
    )
ORDER BY
    -- ITEM_ID 기준으로 내림차순 정렬
    ITEM_ID DESC;