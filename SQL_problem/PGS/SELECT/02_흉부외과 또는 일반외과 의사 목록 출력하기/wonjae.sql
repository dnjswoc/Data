/*
문제 설명
다음은 종합병원에 속한 의사 정보를 담은 DOCTOR 테이블입니다. DOCTOR 테이블은 다음과 같으며
DR_NAME, DR_ID, LCNS_NO, HIRE_YMD, MCDP_CD, TLNO는 각각 의사이름, 의사ID, 면허번호, 고용일자, 진료과코드,
전화번호는 나타냅니다.


문제
DOCTOR 테이블에서 진료과가 흉부회과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는
SQL문을 작성해주세요. 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로
오름차순 정렬해주세요.


주의사항
날짜 포맷은 예시와 동일하게 나와야합니다.
EX. '2020-03-31'
*/


SELECT
    DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD
    -- DATE_FORMAT(date, format) : 날짜 정보를 원하는 format 형태로 변환
    -- %Y : 연도를 4자리 수로 표현
    -- %m : 월을 숫자로 표현(두 자리)
    -- %d : 일을 숫자로 표현(두 자리)
FROM
    DOCTOR
WHERE
    MCDP_CD = 'CS' OR MCDP_CD = 'GS'
ORDER BY
    HIRE_YMD DESC,
    -- HIRE_YMD 기준으로 내림차순(DESC)
    DR_NAME ASC;
    -- DR_NAME 기준으로 오름차순(ASC(default))