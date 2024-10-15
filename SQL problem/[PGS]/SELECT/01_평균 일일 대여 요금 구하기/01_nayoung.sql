SELECT
    -- 반올림(소수 첫 번째 자리에서 함)
    ROUND(AVG(daily_fee),0) AS 'AVERGATE_FEE'
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE
    CAR_TYPE = 'SUV'
GROUP BY 
    -- 자동차 종류의 평균을 구하기 때문에 GROUP 지정
    CAR_TYPE;