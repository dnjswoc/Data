SELECT
  ROUND(AVG(DAILY_FEE)) AS AVERAGE_FEE
  -- ROUND(x [, d]) : x의 반올림 값을 반환하고, d는 d번째 소수점 자릿수에서 반올림을 의미
  -- AS : alias로 칼럼명 임시 네이밍을
FROM
  CAR_RENTAL_COMPANY_CAR
WHERE
  CAR_TYPE = "SUV"
  -- WHERE 절로 자동차 종류가 'SUV'라는 조건을 설정