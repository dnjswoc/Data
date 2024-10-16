-- 데이터 결합
-- 1. UNION 
  -- 새로운 행으로 결합한다.(수직 결합)
  -- UNION : 중복된 값을 제거하고 보여준다.
  -- UNION ALL : 중복된 값을 모두 보여준다.
-- 2. JOIN
  -- 새로운 열로 결합한다.(수평 결합)
(SELECT
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM
    ONLINE_SALE
WHERE
    DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03')
UNION ALL
(SELECT
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    NULL AS USER_ID,
    SALES_AMOUNT
FROM
    OFFLINE_SALE
WHERE
    DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03')
-- WHERE까지는 작성하고 UNION ALL 한 후 따로 ORDER BY를 써준다.
ORDER BY
    SALES_DATE ASC,
    PRODUCT_ID ASC,
    USER_ID ASC;