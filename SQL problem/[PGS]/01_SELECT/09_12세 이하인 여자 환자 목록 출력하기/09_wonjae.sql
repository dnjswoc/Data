SELECT
    PT_NAME, PT_NO, GEND_CD, AGE,
    -- CASE WHEN 조건 THEN 반환값
    -- ELSE 반환값
    -- END
    CASE WHEN TLNO IS NULL THEN 'NONE'
        ELSE TLNO
    END
FROM 
    PATIENT
WHERE
    -- 12세 이하인 여자 회원 조회
    AGE <= 12
    AND GEND_CD = 'W'
ORDER BY
    -- 나이를 기준으로 내림차순, 회원 이름을 기준으로 오름차순
    AGE DESC,
    PT_NAME ASC;