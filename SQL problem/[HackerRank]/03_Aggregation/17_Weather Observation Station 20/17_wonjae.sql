-- 테이블에 존재하는 데이터로 Median(중앙값) 구하기
SET @rowIndex=-1;
SELECT
    ROUND(AVG(LAT_N), 4) AS Median
FROM
    (
    SELECT
        @rowIndex:=@rowIndex + 1 AS RowNumber,
        LAT_N
    FROM
        STATION
    ORDER BY
        LAT_N
    ) SUB
WHERE
    RowNumber IN (FLOOR(@rowIndex / 2), CEIL(@rowIndex / 2));

/*
정리

중앙값 구하는 방법
ex1) 1 3 3 6 7 8 9 => 중앙값 = 6
ex2) 1 2 3 4 5 6 8 9 => 중앙값 = 4.5
일단 오름차순으로 먼저 정렬을 하고 전체 데이터의 개수가 홀수면 가운데 값이 중앙값
데이터의 개수가 짝수면 가운데의 두 값의 평균이 중앙값이 된다.

우선 SQL 쿼리의 논리
1. SET을 통해 행번호를 계산하기 위한 변수를 선언
2. 선언한 변수로 중앙값을 구하기 위해 서브쿼리를 사용하여 오름차순 정렬
3. 오름차순 정렬한 서브쿼리 테이블에서 행번호의 절반에 해당하는 LAT_N 값 평균을 구한다

SET @변수명 : 사용자 정의 변수 선언 시 사용
변수를 선언하고 나서 사용할 때도 '@변수명'으로 사용

서브쿼리 내에 있는 SELECT문
@rowIndex := @rowIndex + 1 -> := 이것은 변수 자동 계산으로 활용할 수 있다(여기서는 행이 하나씩 증가하면서 1을 더해가는 의미로 사용)
python의 a += 1 이것과 같은 의미로 사용

*/
