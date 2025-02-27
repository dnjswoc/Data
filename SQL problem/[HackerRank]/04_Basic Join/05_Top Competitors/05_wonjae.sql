/*
코딩 테스트 결과판을 만드는 중
챌린지 난이도의 만점에 해당하는 결과가 2개 이상인 데이터의 ID와 이름 추출
*/
SELECT
    h.HACKER_ID,
    h.NAME
FROM
    SUBMISSIONS s
JOIN
    CHALLENGES c
ON
    s.CHALLENGE_ID = c.CHALLENGE_ID
JOIN
    -- 난이도 별 만점을 확인하기 위한 JOIN
    DIFFICULTY d
ON
    c.DIFFICULTY_LEVEL = d.DIFFICULTY_LEVEL
JOIN
    -- HACKER_ID와 이름을 조회하기 위한 JOIN
    HACKERS h
ON
    s.HACKER_ID = h.HACKER_ID
WHERE
    -- 만점 받은 결과를 조회하기 위한 조건절
    s.SCORE = d.SCORE
GROUP BY
    h.HACKER_ID,
    h.NAME
HAVING
    -- 만점받은 결과가 2개 이상인 데이터를 조회하기 위한 HAVING 절
    COUNT(*) > 1
ORDER BY
    COUNT(*) DESC,
    h.HACKER_ID ASC;