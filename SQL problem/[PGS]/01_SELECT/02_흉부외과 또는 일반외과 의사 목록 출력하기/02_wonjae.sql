SELECT
  DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, "%Y-%m-%d") AS HIRE_YMD
  -- DATE_FORMAT(date, format) : 날짜 정보를 원하는 format 형태로 변환
  -- %Y : 연도를 4자리 수로 표현
  -- %m : 월을 숫자로 표현(두 자리)
  -- %d : 일을 숫자로 표현(두 자리)
FROM
  DOCTOR
WHERE
  -- IN으로 진료과가 흉부외과(CS)이거나 일반외과(GS)인 데이터 조회
  MCDP_CD IN ('CS', 'GS')
ORDER BY
  HIRE_YMD DESC,
  -- HIRE_YMD 기준으로 내림차순(DESC)
  DR_NAME ASC;
  -- DR_NAME 기준으로 오름차순(ASC(default))