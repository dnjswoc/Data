SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
FROM
    REST_INFO
WHERE
    -- 음식 종류 별 즐겨찾기가 가장 많은 음식 종류와 그에 해당하는 즐겨찾기 수 조회
    (FOOD_TYPE, FAVORITES) IN (
        SELECT
            FOOD_TYPE,
            MAX(FAVORITES)
        FROM
            REST_INFO
        GROUP BY
            FOOD_TYPE
    )
ORDER BY
    -- 음식 종류 기준 내림차순
    FOOD_TYPE DESC;