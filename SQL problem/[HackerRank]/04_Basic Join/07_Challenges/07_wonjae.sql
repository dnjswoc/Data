SELECT
    h.HACKER_ID,
    h.NAME,
    COUNT(*) AS 'CHALLENGES_CREATED'
FROM
    HACKERS h
INNER JOIN
    CHALLENGES c
ON
    h.HACKER_ID = c.HACKER_ID
GROUP BY
    h.HACKER_ID,
    h.NAME
HAVING
    --  생성한 CHALLENGES의 개수가 UNIQUE한 경우
    CHALLENGES_CREATED IN (SELECT
                                CHALLENGES_CREATED
                            FROM
                                (SELECT
                                    COUNT(*) AS CHALLENGES_CREATED
                                FROM
                                    CHALLENGES
                                GROUP BY
                                    HACKER_ID) SUB1
                            GROUP BY
                                CHALLENGES_CREATED
                            HAVING
                                COUNT(*) = 1)
    -- 생성한 CHALLENGES의 개수가 최댓값인 경우
    OR CHALLENGES_CREATED = (SELECT
                                MAX(CHALLENGES_CREATED)
                            FROM
                                (SELECT
                                    COUNT(*) AS CHALLENGES_CREATED
                                FROM
                                    CHALLENGES
                                GROUP BY
                                    HACKER_ID) SUB2)
ORDER BY
    -- 생성한 CHALLENGES 내림차순, HACKER_ID 오름차순
    CHALLENGES_CREATED DESC,
    h.HACKER_ID ASC;