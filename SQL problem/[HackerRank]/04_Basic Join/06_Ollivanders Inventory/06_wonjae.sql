SELECT
    w.ID,
    p.AGE,
    w.COINS_NEEDED,
    w.POWER
FROM
    WANDS w
JOIN
    WANDS_PROPERTY p
ON
    w.CODE = p.CODE
WHERE
    -- IS_EVIL이 0이고, CODE와 POWER를 그룹화해서 그 중에서 COINS_NEEDED의 최솟값을 구한다.
    (w.CODE, w.POWER, w.COINS_NEEDED) IN (
    SELECT
        w.CODE,
        w.POWER,
        MIN(w.COINS_NEEDED)
    FROM
        WANDS w
    JOIN
        WANDS_PROPERTY p
    ON
        w.CODE = p.CODE
    WHERE
        p.IS_EVIL = 0
    GROUP BY
        w.CODE,
        w.POWER
    )
ORDER BY
    w.POWER DESC,
    p.AGE DESC;