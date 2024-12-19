-- 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원의 수 조회
SELECT
    -- 회원 수를 구하기 위한 COUNT함수
    COUNT(*) AS 'USERS'
FROM
    USER_INFO
WHERE
    -- DATE_FORMAT으로 가입일의 연도 추출 후 2021년인 데이터 조회
    DATE_FORMAT(JOINED, '%Y') = '2021'
    -- 나이가 20세 이상 29세 이하인 데이터 조회
    AND AGE BETWEEN 20 AND 29;