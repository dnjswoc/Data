SELECT
    -- SUM으로 아이템 가격의 총합
    SUM(PRICE) AS 'TOTAL_PRICE'
FROM
    ITEM_INFO
WHERE
    -- 희귀도가 LEGEND인 데이터만 조회
    RARITY = 'LEGEND';