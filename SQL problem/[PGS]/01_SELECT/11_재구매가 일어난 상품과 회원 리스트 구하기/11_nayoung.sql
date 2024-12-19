SELECT
    USER_ID,
    PRODUCT_ID
FROM
    ONLINE_SALE
GROUP BY
    -- 동일 아이디가 같은 상품을 구매했는지 확인하기 위해서는 ID와 PRODUCT를 그룹 지정
    USER_ID, PRODUCT_ID
HAVING
    -- 카운트했을때 1보다 크다는 것은 재구매 했다는 증거
    COUNT(USER_ID) > 1
    AND
    COUNT(PRODUCT_ID)>1
ORDER BY
    USER_ID,
    PRODUCT_ID DESC;