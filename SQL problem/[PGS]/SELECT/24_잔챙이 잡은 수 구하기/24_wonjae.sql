SELECT
  COUNT(ID) AS FISH_COUNT
  -- 집계함수 COUNT로 물고기의 수를 계산
  -- AS 키워드로 FISH_COUNT로 칼럼명 지정
FROM
  FISH_INFO
WHERE
  LENGTH IS NULL;
  -- 10cm이하 물고기들은 NULL 값으로 표시되기 때문에 NULL값의 개수를 세면 됩니다.