SELECT
    USER_ID,
    NICKNAME,
    -- CONCAT으로 문자열 합치기
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소',
    -- SUBSTR, SUBSTRING으로 전화번호 추출 후 '-'으로 합치기
    CONCAT(SUBSTRING(TLNO, 1, 3), '-', SUBSTRING(TLNO, 4, 4), '-', SUBSTR(TLNO, 8)) AS '전화번호'
FROM
    USED_GOODS_USER
WHERE
    USER_ID IN (
        SELECT
            WRITER_ID
        FROM
            USED_GOODS_BOARD
        GROUP BY
            WRITER_ID
        HAVING
            COUNT(BOARD_ID) >= 3
    )
ORDER BY
    USER_ID DESC;