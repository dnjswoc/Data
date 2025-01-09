SELECT
    CITY,
    CHAR_LENGTH(CITY)
FROM
    STATION
WHERE
    -- 도시 이름이 가장 짧고, 알파벳 순서가 빠른 도시 조회
    CITY = (
        SELECT
            CITY
        FROM
            STATION
        ORDER BY
            CHAR_LENGTH(CITY) ASC,
            CITY ASC
        LIMIT
            1
    ) OR
    -- 도시 이름이 가장 길고, 알파벳 순서가 빠른 도시 조회
    CITY = (
        SELECT
            CITY
        FROM
            STATION
        ORDER BY
            CHAR_LENGTH(CITY) DESC,
            CITY ASC
        LIMIT
            1
    )