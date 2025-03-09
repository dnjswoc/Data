SELECT
    -- RN을 기준으로 GROUP BY를 했기 때문에 각 직업 별 1번 이름부터 차례대로 출력(아래에서 위로)
    -- MAX()를 사용한 이유 : GROUP BY를 사용했기 때문에 집계 함수를 사용해줘야 함
    -- 각 행 번호마다 값이 하나이기 때문에 다른 집계 함수 사용 가능!(MIN)
    -- 단, 숫자를 써야하는 집계 함수(SUM, AVG 등)나 개수를 세는 집계 함수(COUNT)는 불가능
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS 'Doctor',
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS 'Professor',
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS 'Singer',
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS 'Actor'
FROM
    -- 직업 별로 순서를 매기기 위한 서브쿼리
    -- ROW_NUMBER() : 순서대로 1부터 시작하는 번호를 매긴다(윈도우 함수)
    -- 윈도우 함수 : 결과 집합의 행 각각에 대한 연산을 수행하지만, 기존 GROUP BY와는 다르게 원본 행을 유지(순위 함수, 집계 함수, 행 이동 함수 등이 존재)
    -- 따라서 ROW_NUMBER()를 사용하려면 OVER를 같이 사용해야 한다!
    -- OVER : 윈도우 함수의 동작 범위를 지정하는 역할(안에 PARITION BY나 ORDER BY를 사용)
    -- PARTITION BY : 원본 행을 유지하고, 데이터를 그대로 두면서 추가 연산을 하고 싶을 때 사용!
    (SELECT
        *, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) RN
    FROM
        OCCUPATIONS) TEMP
GROUP BY
    -- RN(직업 별 이름 순서로 지정한 행 번호)를 기준으로 그룹화
    RN;