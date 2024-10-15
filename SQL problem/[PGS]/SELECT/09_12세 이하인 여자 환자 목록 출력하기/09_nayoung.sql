SELECT
    PT_NAME,
    PT_NO,
    GEND_CD,
    AGE,
    -- 조건문으로 처리 
    -- 만약 TLNO가 NULL값이면 NONE으로 출력하고 아니면 TLNO그대로 값 지적
    CASE
        WHEN TLNO IS NULL THEN "NONE"
        ELSE
            TLNO
    -- 조건문 끝으로 별명 TLNO 지정
    END AS 'TLNO'
FROM
    PATIENT
WHERE
    -- 12세이하인 여자환자이기에 GEND_CD = 'W' 와 나이 12이하 조건문 지정
    GEND_CD = 'W'
    AND
    AGE <= 12
ORDER BY
    AGE DESC,
    PT_NAME;