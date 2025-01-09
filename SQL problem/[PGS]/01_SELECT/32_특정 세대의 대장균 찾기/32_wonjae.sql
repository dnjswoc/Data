SELECT
    e3.ID
-- 부모 세대의 ID와 자식 세대의 PARENT_ID를 LEFT JOIN 2번 하여 3세대를 찾는다
FROM
    ECOLI_DATA e1
LEFT JOIN
    ECOLI_DATA e2
ON
    e1.ID = e2.PARENT_ID
LEFT JOIN
    ECOLI_DATA e3
ON
    e2.ID = e3.PARENT_ID
WHERE
    -- e1의 PARENT_ID가 NULL 이면 1세대
    e1.PARENT_ID IS NULL AND
    -- e3의 ID가 NULL이 아니어야 3세대까지 있다고 판단
    e3.ID IS NOT NULL
ORDER BY
    -- e3의 ID를 기준 오름차순 정렬
    e3.ID ASC;