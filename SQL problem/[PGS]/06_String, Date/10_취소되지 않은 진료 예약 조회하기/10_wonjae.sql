-- WITH절을 사용해 2022년 4월 13일에 취소되지 않은 흉부외과 진료내역 가상의 테이블 생성
WITH AP_TB AS (SELECT
    APNT_YMD,
    APNT_NO,
    PT_NO,
    MCDP_CD,
    MDDR_ID,
    APNT_CNCL_YN
FROM
    APPOINTMENT
WHERE
    APNT_YMD LIKE '2022-04-13%' AND
    APNT_CNCL_YN = 'N' AND
    MCDP_CD = 'CS'
)
SELECT
    a.APNT_NO,
    p.PT_NAME,
    p.PT_NO,
    d.MCDP_CD,
    d.DR_NAME,
    a.APNT_YMD
FROM
    AP_TB a
JOIN
    -- 3개의 테이블 JOIN
    PATIENT p
ON
    a.PT_NO = p.PT_NO
JOIN
    DOCTOR d
ON
    a.MDDR_ID = d.DR_ID
ORDER BY
    -- 예약 날짜 기준 오름차순 정렬렬
    a.APNT_YMD ASC;