SELECT
    REST_INFO.REST_ID, REST_INFO.REST_NAME, REST_INFO.FOOD_TYPE,
    REST_INFO.FAVORITES, REST_INFO.ADDRESS,
    -- 평균 리뷰 점수를 소수점 셋째 자리에서 반올림
    ROUND(AVG(REST_REVIEW.REVIEW_SCORE), 2) AS 'SCORE'
FROM
    REST_INFO
JOIN
    REST_REVIEW
ON
    REST_REVIEW.REST_ID = REST_INFO.REST_ID
WHERE
    -- 주소가 서울로 시작
    REST_INFO.ADDRESS LIKE '서울%'
GROUP GROUP BY
    -- 식당 ID로 그룹화하고 리뷰의 평균을 구함
    REST_INFO.REST_ID
ORDER BY
    -- 평균 점수을 기준으로 내림차순 정렬, 만약 평균 점수가 같다면 즐겨찾기 수를 기준으로 내림차순 정렬
    SCORE DESC,
    REST_INFO.FAVORITES DESC;