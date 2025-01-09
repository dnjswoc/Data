SELECT
    NAME
FROM
    STUDENTS
WHERE
    MARKS > 75
ORDER BY
    -- RIGHT : 오른쪽에서 원하는 개수만큼 문자열 추출
    RIGHT(NAME, 3) ASC,
    ID ASC;