-- 코멘트 예약어는 --
-- SQL(Structured Query Language: 구조화 질의어)이고,
-- DBMS(Database Management System)의 데이타를 관리하기 위한
-- 특수(일반아님) 목적의 프로그래밍 언어이다.
-- SQL기반 DB : Oracle, MySQL, MariaDB, MS SQL-Server
-- No-SQL기반 DB : MongoDB, Firebase Realtime DB
-- SQL은 역할에 따라 DML, DDL, DCL, TCL로 나누임.
-- 1. DML (Data Manupulation Language) 데이타 조작어
-- SELECT - 데이타 조회 (검색)
-- DELETE - 데이타 삭제
-- INSERT - 데이타 추가
-- UPDATE - 데이타 수정
-- 2. DDL (Data Definition Language) DBMS 객체를 제어함
-- CREATE - TABLE이나 DB를 생성
-- DROP - TABLE이나 DB를 삭제
-- ALTER - TABLE이나 DB내용 수정
-- 3. DCL(Data Control Language ) DBMS 권한을 제어함
-- GRANT - 읽기/쓰기/수정/삭제 권한 부여
-- REVOKE - 읽기/쓰기/수정/삭제 권한 삭제
-- 4. TCL (Transaction Control Language ) 일괄처리 명령어
-- COMMIT - 일괄처리 확정(수행)
-- ROLLBACK - 일괄처리 되돌림

-- SQL문법에서 "", '' 쌍따옴표 단따옴표는 동일하게 사용.
-- 문장 마지막에 ; 세미콜론은 한줄일 때는 안써도 됨. 여러줄일때는 쓴다.
-- SQL명령어는 대소문자를 구분하지 않음. create나 CREATE가 같은 동작함.
--  가급적 대문자로 표현. user가 정의한 것(테이블이름, 컬럼이름) 소문자.
-- 테이블의 키(Key) - 레코드(데이타 한줄)를 구분하기 위한 구분자(인덱스)
-- 1.기본키 (Primary Key) : DBMS에서 관리하는 중복되지 않는 인덱스번호, 예)주민번호
-- 2.외래키 (Foreign Key) : 한 테이블에서 다른 테이블의 기본키 값을 가질때
--                          이 키를 외래키라고 한다.

-- sql developer프로그램
-- 새 접속 ->접속아이디(DB이름) system
--           계정/암호 system/1234 로 접속
--                맥os system/oracle로 접속
-- 오라클의 기본 계정
-- 1. sys     : DBA 수퍼관리자계정, 암호 설정시부여 1234/맥os oracle
-- 2. system  : DBA 관리자계정, 암호 설정시부여 1234/맥os oracle
-- 3. scott   : 실습용 계정, 암호 tiger
-- 4. 사용자계정 만들기
--    새접속 ->접속아이디(DB이름) ezen
--    계정/암호 ezen/1234 로 접속
-- 사용자계정 만들기
CREATE USER ezen IDENTIFIED BY 1234;
-- 사용자계정 삭제
DROP USER ezen CASCADE;
-- CASCADE : ezen으로 생성한 테이블까지 모두 삭제

-- 사용자계정 권한 부여하기
GRANT CONNECT,RESOURCE,DBA TO ezen;
-- 권한 취소
REVOKE CONNECT,RESOURCE,DBA TO ezen;

-- 사용자계정 비밀번호 수정
ALTER USER ezen IDENTIFIED BY 1111;
ALTER USER ezen IDENTIFIED BY 1234;
-- 오라클의 생성된 계정 목록 확인
SELECT * FROM DBA_USERS; -- DBA(관리자) 포함한 계정 목록
SELECT * FROM ALL_USERS; -- 사용자 계정 목록
-- 실습용 테이블 만들기
CREATE TABLE student
(
  student_no NUMBER(4) NOT NULL,
  name VARCHAR2(20),
  age NUMBER(4),
  phone VARCHAR2(20),
  address VARCHAR2(100),
  memo VARCHAR2(200)
);
-- varchar2의 최대크기 : 4000자
-- number의 최대크기 : 38자리
-- 데이터 타입
-- NUMBER(숫자)          INT
-- VARCHAR2(문자열)      VARCHAR
-- DATE(날짜)            DATE
-- CHAR(문자열)          TEXT
-- 테이블 삭제 (매우 조심!)
DROP TABLE student;

-- 시퀀스 추가 ( 자동인덱스 - 1부터 시작하는 정수인덱스)  1,2,3,4,5,6,7,
CREATE SEQUENCE student_seq;
-- mySQL(MariaDB) : Auto Increment 속성을 추가
-- 데이타 추가
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '홍길동', 30, '010-1111-2222', '한양', '홍길동입니다.');

  -- 데이타 추가
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '홍길동', 30, '010-1111-2222', '한양', '홍길동입니다.');
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '사임당', 40, '010-3333-4444', '천안', '사임당입니다.');
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '임꺽정', 35, '010-5555-6666', '대전', '꺽정입니다.');
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '아이언맨', 45, '010-2222-3333', '뉴욕', '철사람입니다.');
INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '잡스', 20, '010-8888-9999', '시카고', '잡스입니다.');

  -- 모든 데이타 필드 가져오기
-- * 모든 컬럼(필드)(no,name,age...)
SELECT * FROM student;
-- name 필드만 가져오기
SELECT name FROM student;
-- name,age,phone 필드만 가져오기
SELECT name, age, phone FROM student;
-- 검색 조건 넣기 WHERE절
-- name="홍길동" 인 사람만 검색하기
SELECT * FROM student WHERE name = '홍길동';
-- name이 "사"으로 시작하는 사람 검색하기
SELECT * FROM student WHERE name like '사%';

-- name 중간에 "이"을 포함하는 사람 검색하기
SELECT * FROM student WHERE name like '%이%';

-- name이 "정"으로 끝나는 사람 검색하기
SELECT * FROM student WHERE name like '%정';

-- 검색 정렬하기 (오름차순,내림차순)
-- 오름차순 asc
SELECT * FROM student ORDER BY age asc;
-- 내림차순 desc
SELECT * FROM student ORDER BY age desc;

--검색 중복제거하기
SELECT DISTINCT name FROM student;

-- 모든 필드를 가져오면서 중복제거
SELECT * FROM student WHERE student_no IN
      (SELECT min(student_no) FROM student GROUP BY name);

-- DELETE - 데이타 삭제
DELETE FROM student WHERE student_no = 6;

-- INSERT - 데이터 추가


INSERT INTO student
  (student_no, name, age, phone, address, memo)
VALUES
  (student_seq.nextval, '홍길동', 30, '010-1111-2222', '한양', '홍길동입니다.');

-- UPDATE - 데이타 수정
UPDATE student SET address='서울', memo='서울로 이사함.' WHERE name = '홍길동';



-- 연습문제 DM제출 - 워크시트 화면만 보내주세요~
-- 1. student테이블의 모든 필드 데이타를 출력.
-- 2. student테이블의 age, address 필드 데이타만 출력.
-- 3. name이 임꺽정인 데이타(레코드)만 출력
-- 잡스 데이타 추가
-- 4. name이 잡스이고 address가 시카고인 사람만 출력하시오.
-- 5. name이 사임당이거나 나이가 20인 사람을 출력하시오.
-- 6. 데이타 2개 중복해서 추가 
--   NAME, AGE, PHONE, ADDRESS, MEMO
--   헐크 , 33, 010-2222-9999 LA 헐크입니다.
-- 7. 모든 필드를 가져오면서 중복제거한 결과를 출력
-- 8. 나이가 40인 사람의 레코드만 삭제하시오.
-- 9. 이름안에 임을 포함하는 사람들을 출력하되,
--    나이많은 순으로 출력하시오.