SELECT
    BOARD_ID,
    WRITER_ID,
    TITLE,
    PRICE,
    CASE WHEN STATUS = 'SALE' THEN '판매중'
        WHEN STATUS = 'RESERVED' THEN '예약중'
        WHEN STATUS = 'DONE' THEN '거래완료'
        END AS 'STATUS'
FROM
    USED_GOODS_BOARD
WHERE
    -- 게시글 등록일이 2022년 10월 5일인 데이터 조회
    CREATED_DATE = '2022-10-05'
ORDER BY
    -- 게시글 ID 기준으로 내림차순 정렬
    BOARD_ID DESC;