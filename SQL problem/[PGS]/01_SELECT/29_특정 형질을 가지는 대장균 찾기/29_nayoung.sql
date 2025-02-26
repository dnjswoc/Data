-- 이진수 변환 함수
-- CONV(VALUE, 10, 2) --> 10진수 VALUE를 2진수로 변환
-- CONV(VALUE, 2, 10) --> 2진수 VALUE를 10진수로 변환

-- 특정 문자열 추출 함수
-- SUBSTR(문자열, 시작위치, 길이)
-- 문자열 : 부분 문자열을 추출하려는 원본 문자열 / 시작위치 : 추출을 시작할 위치(첫 번쨰 문자 1로 간주) / 길이 : 생략시 전체 길이 추출
-- 음수인 경우 문자열 끝에서부터 계산산

SELECT
    COUNT(*) AS COUNT
FROM
    ( -- 2번 형질을 보유하고 있지 않음
        SELECT
            *
        FROM ECOLI_DATA
        WHERE
            SUBSTR(CONV(GENOTYPE, 10, 2), -2, 1) != '1' 
    ) AS AA   -- 섭쿼리 사용시 별칭 해줘야함
-- 1번이나 3번 형질 보유하고있는 조건 사용
WHERE
    SUBSTR(CONV(GENOTYPE, 10, 2), -3, 1) = '1'
    OR
    SUBSTR(CONV(GENOTYPE, 10, 2), -1, 1) = '1'
;

--- 다른 방식(섭쿼리 사용하지 않음)
SELECT
    COUNT(*) AS COUNT
FROM
    ECOLI_DATA
WHERE
    SUBSTR(CONV(GENOTYPE,10,2),-2,1) !='1' 
    AND
    (SUBSTR(CONV(GENOTYPE,10,2),-3,1) = '1' 
    OR
    SUBSTR(CONV(GENOTYPE,10,2), -1,1) = '1'
    );

