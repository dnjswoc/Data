SELECT
    MCDP_CD AS '진료과코드',
    COUNT(*) AS '5월예약건수'
FROM
    APPOINTMENT
WHERE
    -- 예약일시가 2022년 5월인 데이터 조회
    DATE_FORMAT(APNT_YMD, '%Y-%m') = '2022-05'
GROUP BY
    MCDP_CD
ORDER BY
    -- 5월예약건수 오름차순, 같으면 진료과코드 오름차순 정렬
    COUNT(*) ASC,
    MCDP_CD ASC;