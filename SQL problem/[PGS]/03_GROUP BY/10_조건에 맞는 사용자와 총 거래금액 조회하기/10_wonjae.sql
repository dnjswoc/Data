SELECT
    u.USER_ID,
    u.NICKNAME,
    SUM(b.PRICE) AS 'TOTAL_SALES'
FROM
    USED_GOODS_BOARD b
JOIN
    USED_GOODS_USER u
ON
    b.WRITER_ID = u.USER_ID
WHERE
    -- 중고 거래가 완료된 데이터
    b.STATUS = 'DONE'
GROUP BY
    -- 회원 ID 별 그룹화
    b.WRITER_ID
HAVING
    -- 총 거래 금액이 70만원 이상인 데이터
    -- 그룹화한 결과에 대한 조건을 추가하므로 HAVING절 사용
    SUM(b.PRICE) >= 700000
ORDER BY
    -- 총 거래 금액 기준 오름차순 정렬
    TOTAL_SALES ASC;