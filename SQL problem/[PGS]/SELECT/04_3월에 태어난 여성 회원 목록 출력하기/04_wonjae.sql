SELECT
    MEMBER_ID,
    MEMBER_NAME,
    GENDER,
    -- 날짜를 YYYY-MM-DD 형식으로 나타내기
    DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM
    MEMBER_PROFILE
WHERE
    -- 전화번호가 NULL이 아니고
    TLNO IS NOT NULL
    -- 여성 회원이며
    AND GENDER = 'W'
    -- 생일이 3월이다.
    AND DATE_FORMAT(DATE_OF_BIRTH, '%m') = '03'
ORDER BY
    -- 회원 ID을 기준으로 오름차순 정렬
    MEMBER_ID;