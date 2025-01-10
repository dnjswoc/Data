WITH SKILL_TB AS (SELECT
    d.ID,
    d.EMAIL,
    -- GROUP_CONCAT : 그룹화된 문자열을 콤마를 통해 합치는 것
    GROUP_CONCAT(s.NAME) AS 'NAME',
    GROUP_CONCAT(s.CATEGORY) AS 'CATEGORY'
FROM
    DEVELOPERS d
JOIN
    SKILLCODES s
ON
    -- JOIN할 때 스킬 코드가 일치하는 것만 하도록 설정정
    d.SKILL_CODE & s.CODE = s.CODE
GROUP BY
    -- ID, EMAIL 기준 오름차순 정렬
    d.ID,
    d.EMAIL
)
SELECT
    *
FROM
    (
    SELECT
        CASE WHEN NAME LIKE '%Python%' AND CATEGORY LIKE '%Front End%' THEN 'A'
            WHEN NAME LIKE '%C#%' THEN 'B'
            WHEN CATEGORY LIKE '%Front End%' THEN 'C'
            END AS 'GRADE',
        ID,
        EMAIL
    FROM
        SKILL_TB
    ) a
WHERE
    GRADE IS NOT NULL
ORDER BY
    GRADE ASC,
    ID ASC;