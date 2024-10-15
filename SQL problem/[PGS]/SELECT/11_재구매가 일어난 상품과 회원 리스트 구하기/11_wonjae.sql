SELECT
    USER_ID, PRODUCT_ID
FROM
    ONLINE_SALE
GROUP BY
    -- GROUP BY를 하나만 할 필요가 전혀 없다...
    -- USER_ID와 PRODUCT_ID를 그룹하여
    -- 동일한 회원이 동일한 상품을 구매한 횟수를 구할 수 있다.
    USER_ID,
    PRODUCT_ID
HAVING
    -- 동일한 회원이 동일한 상품을 구매한 횟수가 2보다 크면
    -- 재구매한 것으로 볼 수 있다.
    COUNT(*) >= 2
ORDER BY
    -- USER_ID 기준으로 오름차순, PRODUCT_ID 기준으로 내림차순
    USER_ID ASC,
    PRODUCT_ID DESC;