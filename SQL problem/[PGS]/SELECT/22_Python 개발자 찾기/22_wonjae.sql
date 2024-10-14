SELECT
  ID, EMAIL, FIRST_NAME, LAST_NAME
FROM
  DEVELOPER_INFOS
WHERE
  SKILL_1 IN ('Python') OR
  SKILL_2 IN ('Python') OR
  SKILL_3 IN ('Python')
  -- 'Python' 값이 SKILL_1, SKILL_2, SKILL_3에 있는지 알아보기 위해 비교연산자 IN 사용
ORDER BY
  ID;
  -- ID를 기준으로 오름차순 정렬