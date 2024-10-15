SELECT
  BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, "%Y-%m-%d") AS PUBLISHED_DATE
  -- DATE_FORMAT(date, format)으로 예시와 동일하게 'yyyy-mm-dd'형식으로 변환
  -- 이름은 AS 키워드로 PUBLISHED_DATE로 지정
FROM
  BOOK
WHERE
  PUBLISHED_DATE LIKE "2021%"
  -- 비교연산자 LIKE와 Wildcard character "%"를 사용하여 출판일이 2021년인 데이터를 찾도록 조건 설정
  -- DATE_FORMAT(PUBLISHED_DATE, '%Y') = '2021'
  -- DATE_FORMAT으로 연도를 추출하여 비교하는 것도 가능
  AND CATEGORY = "인문"
ORDER BY
  PUBLISHED_DATE;
  -- 출판일 기준으로 오름차순 정렬해야 하므로 ORDER BY절 사용