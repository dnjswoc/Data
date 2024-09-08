# Database

- Database

    - 개요
    - Relation Database
    - RDBMS

- Database Modeling

    - Proceeding with Database modeling

- Database Normalization

    - 1NF ~ 3NF, BCNF

- SQL 기본 
    - SQL Statements

- DDL
    - CREATE TABLE
    - ALTER TABLE
    - DROP TABLE
    - TRUNCATE TABLE

- 참고

---
### `DataBase`

#### 개요

- 데이터베이스 : 체계적인 데이터 모음

- 데이터 : 저장이나 처리에 효율적인 형태로 변환된 정보

- 증가하는 데이터 사용량

    - 배달의 민족 국내 주문 건수 6억 8천만 건(2020)

    - 구독자 2억 3840만명이 1000억 시간 넷플릭스 시청(2023 1~6월)

    - 전세계 모든 데이터의 약 90%는 2015년 이후 생산된 것(IBM)

- 데이터 센터의 성장

    - 네이버 - 제2데이터센터에 6500억 투자(2020)

    - 카카오 - 제1데이터센터와 제2데이터센터에 1.5조 투자(2022)

    - 전세계 데이터 센터 시장 2022년부터 2026년까지 연평균 20% 이상 성장 예상

- **데이터를 저장하고 잘 관리하여 활용할 수 있는 기술이 중요해짐**

    - 우리가 알고 있는 데이터 저장 방식은 어떤 것이 있을까?

---
### `Relation Database`

- 데이터베이스 역할 : 데이터를 **저장**하고 조작

- 관계형 데이터베이스 : 데이터 간의 **관계**가 있는 데이터 항목들의 모음

    - 테이블, 행, 열의 정보를 구조화하는 방식

    - 서로 관련된 데이터 포인터를 저장하고 이에 대한 엑세스를 제공

    ![alt text](images/image_0.png)
    ![alt text](images/image_1.png)

- 관계 : 여러 테이블 간의 (논리적) 연결

- 관계로 할 수 있는 것

    - 이 관계로 인해 두 테이블을 사용하여 데이터를 다양한 형식으로 **조회**할 수 있음

        - 특정 날짜에 구매한 모든 고객 조회
        
        - 지난 달에 배송일이 지연된 고객 조회 등

- 관계형 데이터베이스 예시

    - 다음과 같이 고객 데이터가 테이블에 저장되어 있다고 가정

    - 고객 데이터 간 비교를 위해서는 어떤 값을 활용해야 할까?

        - 이름? 주소? 만약 동명이인이나 같은 주소지가 있다면?

        - 각 데이터에 고유한 식별 값을 부여하기 **(기본 키, Primary Key)**

            ![alt text](images/image_2.png)

    - 다음과 같이 각 고객이 주문한 주문데이터가 테이블에 저장되어 있다고 가정

    - 누가 어떤 주문을 했는지 어떻게 식별할 수 있을까?

        - 고객 이름? 마찬가지로 동명이인이 있다면?

        - 주문 정보에 고객의 고유한 식별 값을 저장하기 **(외래 키, Foreign Key)**

        ![alt text](images/image_3.png)

<br>

- 관계형 데이터베이스 관련 키워드

    1. `Table(aka Relation)` - 관계라고도 부르긴함

        - 데이터를 기록하는 곳

        ![alt text](imagES/image_4.png)

    2. `Field(aka Column, Attribute)`

        - 각 필드에는 고유한 데이터 형식(타입)이 지정됨

        ![alt text](images/image_5.png)

    3. `Record(aka Row, Tuple)`

        - 각 레코드에는 구체적인 데이터 값이 저장됨

        ![alt text](images/image_6.png)


    4. `Database(aka Schema)`

        - 테이블의 집합

        ![alt text](images/image_7.png)

    5. `Primary Key(기본 키, PK)`

        - 각 레코드의 고유한 값

        - 관계형 데이터베이스에서 **레코드의 식별자**로 활용

        ![alt text](images/image_8.png)


    6. `Foreign Key(외래 키, FK)`

        - 테이블의 필드 중 다른 테이블의 레코드를 식별할 수 있는 키

        - 다른 테이블의 기본 키를 참조

        - 각 레코드에서 서로 다른 테이블 간의 **관계를 만드는 데** 사용

        ![alt text](images/image_9.png)



- 데이터베이스 정리

    - Table은 데이터가 기록되는 곳
    
    - Table에는 행에서 고유하게 식별 가능한 기본 키라는 속성이 있으며, 외래 키를 사용하여 각 행에서 서로 다른 테이블 간의 `관계`를 만들 수 있음

    - 데이터는 기본 키 또는 외래 키를 통해 결합(join)될 수 있는 여러 테이블에 걸쳐 구조화 됨


## RDBMS
- DBMS(Database Management System) : 데이터베이스를 관리하는 소프트웨어 프로그램
    - 데이터 저장 및 관리를 용이하게 하는 시스템
    - 데이터베이스와 사용자 간의 인터페이스 역할
    - 사용자가 데이터 구성, 업데이트, 모니터링, 백업, 복구 등을 할 수 있도록 도움

- RDBMS(Relational Database Management System) : 관계형 데이터베이스를 관리하는 소프트웨어 프로그램

- RDBMS 서비스 종류
    - SQLite
    - MySQL
    - PostgreSQL
    - Oracle Database 등


# Database Modeling
- Database Modeling
    - 데이터베이스 시스템을 구축하기 위한 과정으로 데이터의 구조, 관계, 특성을 결정하는 작업
    - 효율성, 일관성, 무결성을 보장하기 위해 진행하는 중요한 단계

- 무결성 제약 조건
    - 데이터베이스의 데이터 일관성을 유지하고 부적절한 데이터의 삽입, 수정, 삭제를 방지하여 데이터의 신뢰성을 보장하는 조건

    1. 개체 무결성(Entity Integrity)
        - 기본 키의 값이 중복되지 않고, NULL 값이 허용되지 않는 것을 보장하는 제약 조건
            - 각 레코드는 유일한 식별자를 가져야 한다.
            - 기본 키는 NULL 값을 가질 수 없다.

    2. 참조 무결성(Referential Integrity)
        - 외래 키와 기본 키 간의 관계를 유지하고, 무효한 참조를 방지하는 제약 조건
            - 외래 키 값은 참조하는 테이블의 기본 키 값을 참조하거나 NULL 값을 가질 수 있다.
            - 존재하지 않는 기본 키는 참조할 수 없다.

    3. 도메인 무결성(Domain Integrity)
        - 각 속성의 값이 정의된 도메인에 속하는 것을 보장하는 제약 조건
            - 도메인은 속성이 가질 수 있는 값의 범위, 형식, 제약 조건 등을 정의해야 한다.
            - 속성 값이 도메인에 속하지 않는 경우에는 삽입 또는 수정을 제한하거나 오류를 발생시킨다.
            - 도메인 무결성 위배 예시
                - 나이 속성은 (0~150) 사이의 정수로 제약을 걸지 않는다면, 다양한 유형의 데이터가 저장될 수 있어 관리가 힘들어진다.
                    - 입력 가능한 유형 : 23, 1995년생, 스물 다섯, twenty seven, 이립


## Proceeding with Database modeling
- 데이터베이스 모델링 진행
    - 요구사항 수집 및 분석 → 개념석 설계 → 논리적 설계 → 물리적 설계

    1. 요구사항 수집 및 분석
        - 어떤 종류의 데이터를 정리하는지 정보 수집하고 어떤 작업을 수행해야 하는지 파악하는 단계
            - 객체(Entity)
                - 업무에 필요하고 유용한 정보를 저장하는 집합적인 것
                - Ex. 고객, 제품, 사원, 부서
            - 속성(Attribute)
                - 관리하고자 하는 것의 의미를 더 이상 작은 단위로 분리되지 않은 데이터 단위
                - Ex. 고객명, 고객 전화번호, 상품명, 상품 가격
            - 관계(Relationship)
                - 객체 사이의 논리적인 연관성을 의미하는 것
                - Ex. 고객 - 상품, 부서 - 사원

    2. 개념적 설계
        - 요구사항을 기반으로 데이터베이스의 개념적 모델을 설계
        - 개체(Entity)와 관계(Relationship)를 식별하고, 개체 간의 관계를 정의하여 ER Diagram을 작성


        - ERD 표기 방법
            - 까마귀 발 모델(Crow's Foot Model) 표기법


            - N:M 관계 예시

    3. 논리적 설계
        - 개념적 설계를 기반으로 데이터베이스의 논리적 구조를 설계
        - 테이블, 칼럼(속성), 제약 조건 등과 같은 구체적인 데이터베이스 개체를 정의
        - 정규화를 수행하여 데이터의 중복을 최소화하고 일관성을 유지


    4. 물리적 설계
        - 논리적 설계를 기반으로 데이터베이스를 실제 저장 및 운영할 수 있는 형태로 변환하는 단계
        - 테이블의 인덱스, 파티션, 클러스터링 등 물리적인 구조와 접근 방식을 결정
        - 보안, 백업 및 복구, 성능 최적화 등을 고려하여 데이터베이스를 설정


# Datbase Normalization
- 정규화(Normalization) : 중복을 최소화하고 데이터의 일관성과 효율성을 유지하기 위해 데이터를 구조화하는 과정

- 정규화의 목적
    - 불필요한 데이터를 제거하여 중복을 최소화 하기 위해
    - 각종 이상 현상(Anomaly)을 방지하기 위해
    - 데이터베이스 구조를 변경할 때 다시 구조화 해야 하는 영역을 최소화

- 이상 현상(Anomaly)
    - 데이터베이스를 잘못 설계 했을 때 발생할 수 있는 불필요한 데이터 중복으로 인한 부작용
    1. 삽입 이상(Insertion Anomaly)
        - 새로운 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야 하는 문제

    2. 갱신 이상(Update Anomaly)
        - 중복 튜플 데이터 중에서 일부만 변경하여 데이터가 불일치되는 문제

    3. 삭제 이상(Deletion Anomaly)
        - 튜플 데이터를 삭제하는 경우 반드시 있어야 하는 데이터까지 같이 삭제되는 문제

## 1NF ~ 3NF, BCNF
- 데이터베이스 정규화의 종류 : 1NF ~ 6NF (+BCNF)가 있지만 일반적으로 3NF만 되면 정규화가 되었다고 표현

- 정규화 종류 및 규칙
    - 제 1 정규화 (1NF)
        - 각 요소의 중복되는 항목은 없어야 한다.

    - 제 2 정규화 (2NF)
        - 제 1 정규화를 만족하면서 PK가 아닌 모든 속성이 PK에 완전 함수 종속되어야 한다.

    - 제 3 정규화 (3NF)
        - 제 2 정규화를 만족하면서 모든 속성이 PK에 이행적 함수 종속이 되지 않아야 한다.

    - BCNF (Boyce Codd Normalization Form)
        - 제 3 정규화에 PK가 아닌 속성이 PK의 속성을 결정 지을 수 없어야 한다.


- 제 1 정규화 (1NF)
    - 각 속성이 원자적(Atomic)이며, 각 행이 유일한 식별자(Primary Key)를 가져야 함
        - 중복된 데이터를 허용하지 않음


- 제 1 정규화 (1NF) 시도
    - 2개를 초과하는 전화번호를 저장할 수 없으며, 불필요한 NULL 값을 가지게 됨

    - 기본 키가 중복 됨

    - 고객 번호에 따른 전화번호를 저장하는 테이블로 분리


- 제 2 정규화 (2NF)
    - 제 1 정규화를 만족하며, 기본 키에 모든 속성이 완전 함수적 종속(Fully Functional Dependency)을 가져야 함
        - 즉, 테이블의 모든 칼럼이 기본 키에 대해 완전하게 종속되어야 함
        - 아래는 생산지가 생산자에 부분 함수적 종속이 되어 있음

        - 완전 함수적 종속

        - 부분 함수적 종속
    
    - 생산자와 생산지가 완전 함수적 종속이 되도록 테이블 분리



- 제 3 정규화 (3NF)
    - 제 2 정규화를 만족하며, 이행적 함수 종속(Transitive Dependency)이 없어야 함
        - 이행적 함수 종속이란
            - A → B, B → C가 성립할 때, A → C가 성립하는 것
            - 기본 키가 아닌 다른 속성에 종속된 경우를 의미함

    
    - 학과와 학과장을 분리


- BCNF (Boyce Codd Normal Form)
    - 제 3 정규화를 진행한 테이블에 대해 모든 결정자가 후보 키가 되도록 테이블을 분리하는 것
        - 즉, PK가 아닌 속성이 PK의 속성을 결정 지을 수 없어야 함
        - 아래 테이블은 담당 교수가 하나의 과목만 맡고 있다고 가정했을 때


    - 김교수가 '국문학의 이해' → '고전 문학의 이해'로 명칭을 변경할 수 있음
        - 담당 교수가 과목의 결정자가 됨

        - 과목은 담당 교수를 따라갈 수 밖에 없어 갱신 이상 발생 가능


    - 담당 교수와 과목명을 따로 분리



# SQL 기본
- SQL(Structure Query Language, 테이블의 형태로 **구조화**된 관계형 데이터베이스에게 요청을 **질의(요청)**)
    - 데이터베이스에 정보를 저장하고 처리하기 위한 프로그래밍 언어
    - 관계형 데이터베이스와의 대화를 위해 사용하는 프로그래밍 언어

- SQL Syntax
    ```SQL
    SELECT column_name FROM table_name;
    ```
    1. SQL 키워드는 대소문자를 구분하지 않음
        - 하지만 대문자로 작성하는 것을 권장 (명시적 구분)
    
    2. 각 SQL Statements의 끝에는 세미콜론(';')이 필요
        - 세미콜론은 각 SQL Statements을 구분하는 방법 (명령어의 마침표)

## SQL Statements
- SQL Statements : SQL을 구성하는 가장 기본적인 코드 블록

- SQL Statements 예시
    ```SQL
    SELECT column_name FROM table_name;
    ```
    - 해당 예시 코드는 SELECT Statements라 부름
    - 이 Statement는 SELECT, FROM 2개의 keyword로 구성 됨


- 수행 목적에 따른 SQL Statements 4가지 유형
    1. DDL - 데이터 정의
    2. DQL - 데이터 검색
    3. DML - 데이터 조작
    4. DCL - 데이터 제어



- SQL 학습
    - 단순히 SQL 문법을 암기하고 상황에 따라 실행만 하는 것이 아닌 SQL을 통해 관계형 데이터베이스를 잘 이해하고 다루는 방법을 학습


# DDL
- DDL(Data Definition Language) : 테이블을 정의하고 수정하고 삭제를 위한 SQL

## CREATE TABLE
- CREATE TABLE statement : 테이블 생성

- CREATE TABLE syntax
    ```SQL
    CREATE TABLE table_name (
        column_1 data_type constraints,
        column_2 data_type constraints,
        ...,
    );
    ```
    - 각 필드에 적용할 데이터 타입 작성
    - 테이블 및 필드에 대한 제약조건(constraints) 작성

- CREATE TABLE 활용
    - examples 테이블 생성 및 확인
        ```SQL
        CREATE TABLE examples (
            ExamId INT PRIMARY KEY AUTO_INCREMENT,
            LastName VARCHAR(50) NOT NULL,
            FirstName VARCHAR(50) NOT NULL
        )
        ```

- SCHEMA 확인하기
    - 테이블 schema(구조) 확인
        ```SQL
        DESCRIBE examples;
        ```

        ```SQL
        SHOW CREATE TABLE examples;
        ```


- 데이터 타입
    ```SQL
    CREATE TABLE examples (
        ExamId INT PRIMARY KEY AUTO_INCREMENT,
        LastName VARCHAR(50) NOT NULL,
        FirstName VARCHAR(50) NOT NULL
    )
    ```

- MySQL 데이터 타입
    1. NULL
        - 아무런 값도 포함하지 않음을 나타냄

    2. 문자열 타입
        - CHAR : 고정 길이
        - VARCHAR : 가변 길이
        - TEXT : 긴 텍스트

    3. 숫자 타입
        - 정수 : INT, BIGINT
        - 실수
            - 부동 소수점 : FLOAT, DOUBLE
            - 고정 소수점 : DECIMAL

    4. 날짜와 시간 타입
        - DATE, DATETIME
        - TIMESTAMP
            - 자동으로 현재 시간 설정 가능

    5. 기타 데이터 타입
        - BOOL
        - ENUM(val1, val2, val3, ...)
            - 정의된 값 중 하나를 선택
        - BLOB
            - 대용량 바이너리 데이터



- 제약 조건
    ```SQL
    CREATE TABLE examples (
        ExamId INT PRIMARY KEY AUTO_INCREMENT,
        LastName VARCHAR(50) NOT NULL,
        FirstName VARCHAR(50) NOT NULL
    )
    ```

    - Constraints(제약 조건) : 테이블의 필드에 적용되는 규칙 또는 제한 사항
        - 데이터의 무결성을 유지하고 데이터베이스의 일관성을 보장


- 자주 사용하는 제약 조건
    - PRIMARY KEY
        - 해당 필드를 기본 키로 지정

    - NOT NULL
        - 해당 필드에 NULL 값을 허용하지 않도록 지정

    - FOREIGN KEY
        - 다른 테이블과의 외래 키 관계를 정의

    - CHECK (MySQL 8.0.16 이상부터 사용 가능)
        - 저장되는 값이 특정 조건을 만족하는지 확인


- 제약 조건 정의 방법

    - 한 줄에 길게 작성되는 경우 뒷부분에 제약 조건 작성 가능
    - CONSTRAINT Keyword : 제약 조건에 이름 부여


- CONSTRAINT 키워드
    - 제약 조건에 이름을 부여하여 정의할 때 사용하는 키워드
        - 데이터 베이스 구조 및 관리 용이
        - 디버깅 및 오류 추적에 용이
        - 유지 보수에 용이
    - CONSTRAINT 키워드로 정의 가능한 제약 조건
        - PRIMARY KEY
        - FOREIGN KEY
        - UNIQUE
        - CHECK

- AUTO_INCREMENT 키워드
    ```SQL
    CREATE TABLE examples (
        ExamId INT PRIMARY KEY AUTO_INCREMENT,
        LastName VARCHAR(50) NOT NULL,
        FirstName VARCHAR(50) NOT NULL
    )
    ```

- **AUTO_INCREMENT** keyword : 자동으로 고유한 정수 값을 생성하고 할당하는 필드 속성

- AUTO_INCREMENT 특징
    - 필드의 자동 증가를 나타내는 특수한 키워드
    - 주로 primary key 필드에 적용
    - INT PRIMARY KEY AUTO_INCREMENT가 작성된 필드는 항상 새로운 레코드에 대해 이전 최대 값보다 큰 값을 할당
    - 삭제된 값은 무시되면 재사용하지 않음


## ALTER TABLE
- **ALTER TABLE** statement : 테이블 및 필드 조작

- ALTER TABLE 역할


1. ALTER TABLE ADD COLUMN syntax
    ```SQL
    ALTER TABLE
        table_name
    ADD COLUMN
        col_name column_definition;
    ```
    - ADD COLUMN 키워드 이후 추가하고자 하는 새 필드 이름과 데이터 타입 및 제약 조건 작성
    - 단, 추가하고자 하는 필드에 NOT NULL 제약 조건이 있을 경우 NULL이 아닌 기본 값 설정 필요

    - ALTER TABLE ADD COLUMN 활용
        - examples 테이블에 다음 조건에 맞는 Country 필드 추가

        ```SQL
        ALTER TABLE
            examples
        ADD COLUMN
            Country VARCHAR(100) NOT NULL DEFAULT 'default value';
        ```

        - examples 테이블에 다음 조건에 맞는 Age, Address 필드 추가

        ```SQL
        ALTER TABLE examples
        ADD COLUMN Age INTEGER NOT NULL DEFAULT 0,
        ADD COLUMN Address VARCHAR(100) NOT NULL DEFAULT 'default value';
        ```
        - ADD COLUMN 사이에 ,를 붙여서 여러 칼럼을 한 번에 추가 가능

2. ALTER TABLE RENAME COLUMN syntax
    ```SQL
    ALTER TABLE
        table_name
    RENAME COLUMN
        current_name TO new_name
    ```
    - RENAME COLUMN 키워드 뒤에 이름을 바꾸려는 필드의 이름을 지정하고 TO 키워드 뒤에 새 이름을 지정

    - ALTER TABLE RENAME COLUMN 활용
        - examples 테이블 Address 필드의 이름을 PostCode로 변경

        ```SQL
        ALTER TABLE examples
        RENAME COLUMN Address TO PostCode;
        ```


3. ALTER TABLE RENAME TO syntax
    ```SQL
    ALTER TABLE
        table_name
    RENAME TO
        new_table_name
    ```
    - RENAME TO 키워드 뒤에 새로운 테이블 이름 지정

    - ALTER TABLE RENAME TO 활용
        - examples 테이블 이름을 new_examples로 변경

        ```SQL
        ALTER TABLE examples
        RENAME TO new_examples;
        ```

## DROP TABLE
- **DROP TABLE** statment : 테이블 삭제

- DROP TABLE syntax
    ```SQL
    DROP TABLE table_name;
    ```
    - DROP TABLE statement 이후 삭제할 테이블 이름 작성


- DROP TABLE 활용
    - new_examples 테이블 삭제
        ```SQL
        DROP TABLE new_examples;
        ```



## TRUNCATE TABLE
- **TRUNCATE TABLE** statement : 테이블의 모든 데이터 비우는 작업
    - DELETE와 유사하지만 TRUNCATE 동작은 Table을 DROP 후 재생성하기 때문에 ID (PK) 값이 초기화 됨

- TRUNCATE TABLE syntax
    ```SQL
    TRUNCATE [TABLE] table_name;
    ```
    - TRUNCATE [TABLE] statement 이후 데이터를 삭제할 테이블 이름 작성



# 참고
- Query
    - "데이터베이스로부터 정보를 요청" 하는 것
    - 일반적으로 SQL로 작성하는 코드를 쿼리문(SQL문)이라 함

- sQL 표준
    - SQL은 미국 국립 표준 협회(ANSI)와 국제 표준화 기구(ISO)에 의해 표준이 채택됨
    - 모든 RDBMS에서 SQL 표준을 지원
    - 다만 각 RDBMS마다 독자적인 기능에 따라 표준을 벗어나는 문법이 존재하니 주의

- 반드시 NOT NULL 제약을 사용해야 할까?
    - "NO"
    - 하지만 데이터베이스를 사용하는 프로그램에 따라 NULL을 저장할 필요가 없는 경우가 많으므로 대부분 NOT NULL을 정의
    - "값이 없다." 라는 표현을 테이블에 기록하는 것이니 "0"이나 "빈 문자열" 등을 사용하는 것으로 대체하는 것을 권장
