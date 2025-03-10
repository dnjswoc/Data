# Chapter 1. 빅데이터의 이해

- 빅데이터 개요 및 활용
- 빅데이터 기술 및 제도



## Section 1. 빅데이터 개요 및 활용

### 1. 데이터와 정보

- 데이터의 정의 : 추론과 추정의 근거를 이루는 사실

- 데이터의 특징

  - 단순한 객체로도 가치가 있으며 다른 객체와의 상호관계 속에서 더 큰 가치를 갖는다.
  - 객관적 사실이라는 존재적 특성을 갖는다
  - 추론, 추정, 예측, 전망을 위한 근거로써 당위적 특성을 갖는다.

- 데이터의 구분

  ||정량적 데이터|정성적 데이터|
  |:--:|:--:|:--:|
  |유형|정형 데이터, 반정형 데이터|비정형 데이터|
  |특징|여러 요소의 결합으로 의미 부여|객체 하나가 함축된 의미 내포|
  |관점|주로 객관적 내용|주로 주관적 내용|
  |구성|수치나 기호 등|문자나 언어 등|
  |형태|데이터베이스, 스프레드시트 등|웹 로그, 텍스트 파일 등|
  |위치|DBMS, 로컬 시스템 등 내부|웹사이트, 모바일 플랫폼 등 외부|
  |분석|통계 분석 시 용이|통계 분석 시 어려움|
  <br>

- 데이터의 유형

  1. 정형 데이터(Structured Data)

    - 정해진 형식과 구조에 맞게 저장되도록 구성된 데이터이며, 연산이 가능하다.
    - RDBMS 테이블에 저장되는 데이터

  2. 반정형 데이터(Semi-structured Data)

    - 데이터의 형식과 구조가 비교적 유연하고, 스키가 정보를 데이터와 함께 제공하는 파일의 형식의 데이터, 연산이 불가능
    - JSON, XML, RDF, HTML 등

  3. 비정형 데이터(Unstructured Data)

    - 구조가 정해지지 않은 대부분의 데이터, 연산이 불가능
    - 동영상, 이미지, 음성, 문서, 메일 등


- 데이터 근원에 따른 분류

  ||가역 데이터|불가역 데이터|
  |:--:|:--:|:--:|
  |환원성(추적성)|가능(비가공 데이터)|불가능(가공 데이터)|
  |의존성|원본 데이터 그 자체|원본 데이터와 독립된 새 객체|
  |원본과의 관계|1대1의 관계|1대N, N대1 또는 M대N의 관계|
  |처리과정|탐색|결합|
  |활용분야|데이터 마트, 데이터 웨어하우스|데이터 전처리, 프로파일 구성|
  <br>


- 데이터의 기능


  - 암묵지 : 어떠한 시행착오나 다양하고 오랜 경험을 통해 개인에게 체계화되어 있으며, 외부에 표출되지 않은 무형의 지식으로 그 전달과 공유가 어렵다.

  - 형식지 : 형상화된 유형의 지식으로 그 전달과 공유가 쉽다.


- 지식창조 매커니즘

  1. 공통화(Socialization) : 서로의 경험이나 인식을 공유하며 한 차원 높은 암묵지로 발전시킨다.

  2. 표출화(Externalization) : 암묵지가 구체화되어 외부(형식지)로 표현된다.

  3. 연결화(Combination) : 형식지를 재분류하여 체계화한다.

  4. 내면화(Internalization) : 전달받은 형식지를 다시 개인의 것으로 만든다.

  - 공통화 → 표출화 → 연결화 → 내면화


- 데이터, 정보, 지식, 지혜

  - 지혜(Wisdom)

    - 축적된 지식을 통해 근본적인 원리를 이해하고 아이디어를 결합하여 도출한 창의적 산물이다.
    - 예. 다른 상품들도 온라인 쇼핑 시 오프랑니 상점보다 저렴할 것이다.

  - 지식(Knowledge)

    - 상호 연결된 정보를 구조화하여 유의미한 정보를 분류하고 개인적인 경험을 결합시켜 내재화한 고유의 결과물이다.
    - 예. 오프라인 상점보다 저렴한 온라인 쇼핑으로 노트북을 구매할 것이다.

  - 정보(Information)

    - 데이터를 가공하거나 처리하여 데이터 간 관계를 분석하고 그 속에서 도출된 의미를 말하며, 항상 유용한 것은 아니다.
    - 오프라인 상점보다 온라인 쇼핑 시 노트북 가격이 더 저렴하다.

  - 데이터(Data)

    - 현실 세계에서 관찰하거나 측정하여 수집한 사실이나 값으로 개별 데이터로는 그 의미가 중요하지 않은 객관적인 사실이다.
    - 예. 온라인 쇼핑 시 노트북 가격은 100만원이며, 오프라인 상점의 노트북 가격은 150만원이다.



### 2. 데이터베이스

- 데이터베이스의 정의

  - 체계적이거나 조직적으로 정리되고 전자식 또는 기타 수단으로 개별적으로 접근할 수 있는 독립된 저작물, 데이터 또는 기타 소재의 수집물이다.




## Section 2. 빅데이터 기술 및 제도

