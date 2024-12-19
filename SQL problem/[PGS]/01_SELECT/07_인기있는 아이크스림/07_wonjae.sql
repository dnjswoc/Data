SELECT
  FLAVOR
  -- 상반기에 판매된 아이스크림의 맛을 조회
FROM
  FIRST_HALF
ORDER BY
  TOTAL_ORDER DESC,
  -- 총주문량을 기준으로 내림차순
  SHIPMENT_ID ASC;
  -- 총주문량이 같다면 출하 번호를 기준으로 오름차순