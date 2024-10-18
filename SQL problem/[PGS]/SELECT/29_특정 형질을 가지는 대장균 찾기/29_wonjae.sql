SELECT
    COUNT(*) AS 'COUNT'
FROM
    ECOLI_DATA
WHERE
    -- 2번 형질을 보유하고 있지 않으면서
    -- 2의 (N-1) 제곱이 N번 형질을 나타낸다.
    -- 비트 연산을 통해 0이 되면 그 값을 가지고 있지 않고,
    -- 0보다 큰 값이 나오면 그 값을 가지고 있다고 볼 수 있다.
    GENOTYPE & 2 = 0
    -- 1번이나 3번 형질을 보유하고 있는 대장균 개체의 수 조회
    AND (GENOTYPE & 1 > 0
        OR GENOTYPE & 4 > 0);