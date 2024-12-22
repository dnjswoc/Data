SELECT
    CAR_ID,
    -- 2022-10-16이 START_DATE와 END_DATE 사이에 있다면 1로 하고, 그렇다면 '대여중'으로 판단
    CASE WHEN MAX('2022-10-16' BETWEEN START_DATE AND END_DATE) = 1 THEN '대여중'
        ELSE '대여 가능'
    END AS 'AVAILABILITY'
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
ORDER BY
    CAR_ID DESC;


-- 처음에 생각한 오답 코드
SELECT
    CAR_ID,
    CASE WHEN START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16' THEN '대여중'
        ELSE '대여 가능'
    END AS 'AVAILABILITY'
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    -- 서브쿼리를 사용하여 가장 마지막의 대여 기록으로 판단
    -- 하지만 2022년 10월 16일 기준이므로 마지막 대여 기록으로 판단하면 안된다
    (CAR_ID, START_DATE) IN (
        SELECT
            CAR_ID,
            MAX(START_DATE)
        FROM
            CAR_RENTAL_COMPANY_RENTAL_HISTORY
        GROUP BY
            CAR_ID
    )
ORDER BY
    CAR_ID DESC;