# A.ID를 부모로 둔 B.ID 테이블 관계형성
SELECT
    A.ID,
    # COUNT(*) : NULL ROW를 포함한 모든 것을 세고
    # COUNT(컬럼명) : NULL 제외하고 세는 것
    COUNT(B.ID) AS CHILD_COUNT
FROM
    ECOLI_DATA A
LEFT JOIN ECOLI_DATA B
ON A.ID = B.PARENT_ID
# A.ID를 그룹화한거 갯수 COUNT
GROUP BY A.ID
ORDER BY A.ID;