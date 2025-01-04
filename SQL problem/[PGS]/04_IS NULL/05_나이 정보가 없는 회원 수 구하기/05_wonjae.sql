SELECT
    COUNT(USER_ID) AS 'USERS'
FROM
    USER_INFO
WHERE
    -- 나이 정보가 없는 회원 정보 조회
    AGE IS NULL;