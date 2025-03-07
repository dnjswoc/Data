SELECT
    sub.HACKER_ID,
    h.NAME,
    SUM(MAX_SCORE) AS 'SUM_SCORE'
FROM
    -- 서브쿼리를 통해 hacker_id와 challenge_id를 그룹화한 후 score의 최댓값을 구한다
    (SELECT
        HACKER_ID,
        CHALLENGE_ID,
        MAX(SCORE) AS 'MAX_SCORE'
    FROM
        SUBMISSIONS
    GROUP BY
        HACKER_ID,
        CHALLENGE_ID) sub
INNER JOIN
    -- hacker의 name을 구하기 위한 join
    HACKERS h
ON
    h.HACKER_ID = sub.HACKER_ID
GROUP BY
    sub.HACKER_ID,
    h.NAME
HAVING
    -- 최댓값의 합이 0이 아닌 값을 추출
    SUM_SCORE != 0
ORDER BY
    SUM_SCORE DESC,
    sub.HACKER_ID ASC;