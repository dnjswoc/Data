SELECT
    -- CONCAT으로 문자열 합치기
    CONCAT('/home/grep/src/', BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) AS 'FILE_PATH'
FROM
    USED_GOODS_FILE
WHERE
    -- 서브쿼리를 사용하여 조회수가 가장 높은 게시물 ID에 해당하는 파일 조회회
    BOARD_ID = (
        SELECT
            BOARD_ID
        FROM
            USED_GOODS_BOARD
        ORDER BY
            VIEWS DESC
        LIMIT
            1    
    )
ORDER BY
    FILE_ID DESC;