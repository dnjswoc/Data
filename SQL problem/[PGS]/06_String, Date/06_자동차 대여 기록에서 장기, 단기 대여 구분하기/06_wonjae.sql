SELECT
    HISTORY_ID,
    CAR_ID,
    DATE_FORMAT(START_DATE, '%Y-%m-%d') AS 'START_DATE',
    DATE_FORMAT(END_DATE, '%Y-%m-%d') AS 'END_DATE',
    -- 대여일이 30일 이상이면 '장기 대여'로, 그렇지 않으면 '단기 대여'로 설정
    CASE WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 30 THEN '장기 대여'
        ELSE '단기 대여'
        END AS 'RENT_TYPE'
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    -- 대여 시작일이 2022년 9월인 데이터 조회
    START_DATE LIKE '2022-09%'
ORDER BY
    -- HISTORY_ID 기준으로 내림차순 정렬렬
    HISTORY_ID DESC;