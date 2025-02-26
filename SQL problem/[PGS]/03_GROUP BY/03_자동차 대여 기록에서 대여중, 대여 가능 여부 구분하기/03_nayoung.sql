SELECT
    CAR_ID,
    CASE 
        # MAX는 각 CAR_ID 그룹에 대해 여러 대여 기록 중 하나라도 2022년 10월 16일에 "대여중"인 상태가 있는지 확인하는 역할을 합니다
        WHEN MAX((END_DATE >= '2022-10-16' AND START_DATE <= '2022-10-16')) THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
ORDER BY
    CAR_ID DESC;