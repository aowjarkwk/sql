-- 두개의 테이블에서 데이타를 조작할 때 쓰는 명령어
-- 조인(JOIN) (회원가입-멤버, 주문-목록,1:1문의-목록)
-- 테이블을 2개 만들자
-- 걸그룹 목록 테이블
CREATE TABLE girl_group
(
  girl_group_id NUMBER(4) NOT NULL,
  name VARCHAR2(32) NOT NULL,
  debut DATE NOT NULL,
  hit_song_id NUMBER(3),
  CONSTRAINT girl_group_pk PRIMARY KEY (girl_group_id)
);
-- 히트송 목록 테이블
CREATE TABLE song
(
  song_id NUMBER(3) NOT NULL,
  title VARCHAR2(100) NOT NULL,
  lyrics VARCHAR2(100),
  CONSTRAINT song_pk PRIMARY KEY (song_id)
);
CREATE SEQUENCE girl_group_seq;
-- 걸그룹 데이타 추가
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '원더걸스', '2007-09-12', 101);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '소녀시대', '2009-06-03', 102);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '카라', '2009-07-30', 103);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '브라운아이드걸스', '2008-01-17', 104);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '다비치', '2009-02-27', 105);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '2NE1', '2009-07-08', 107);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, 'f(x)', '2011-04-20', 109);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '시크릿', '2011-01-06', 110);
INSERT INTO girl_group
  (girl_group_id, name, debut, hit_song_id)
VALUES
  (girl_group_seq.nextval, '레인보우', '2010-08-12', 111);
INSERT INTO girl_group
  (girl_group_id, name, debut)
VALUES
  (girl_group_seq.nextval, '에프터 스쿨', '2009-11-25');
INSERT INTO girl_group
  (girl_group_id, name, debut)
VALUES
  (girl_group_seq.nextval, '포미닛', '2009-08-28');
-- 히트송 테이블 삭제
DROP TABLE song;
-- 히트송 테이블 생성
CREATE TABLE song
(
  song_id NUMBER(3) NOT NULL,
  title VARCHAR2(100) NOT NULL,
  lyrics VARCHAR2(100),
  CONSTRAINT song_pk PRIMARY KEY (song_id)
);
-- 히트송 시퀀스 삭제
DROP SEQUENCE song_seq;
-- 히트송 시퀀스 추가
CREATE SEQUENCE song_seq START WITH 101;
-- 히트송 데이타 추가
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'Tell Me', 'tell me tell me tetetete tel me');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'Gee', 'GEE GEE GEE GEE GEE BABY BABY');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '미스터', '이름이 뭐야 미스터');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'Abracadabra', '이러다 미쳐 내가 여리여리');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '8282', 'Give me a call Baby baby');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '기대해', '기대해');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'I Dont car', '다른여자들의다리를');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'Bad Girl Good Girl', '앞에선한마디말도');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '피노키오', '뉴예삐오');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '별빛달빛', '너는내별빛내마음의별빛');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'A', 'A워오우워오우워우우우');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '나혼자', '나 혼자 밥을 먹고 나 혼자 영화 보고');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'LUV', '설레이나요');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '짧은치마', '짧은 치마를 입고 내가 길을 걸으면');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, '위아래', '위 아래 위위 아래');
INSERT INTO song
  (song_id, title, lyrics)
VALUES
  (song_seq.nextval, 'Dumb Dumb' , '너 땜에 하루종일');
-- JOIN 문법
-- 참조사이트 : https://yoo-hyeok.tistory.com/98
-- AS절 : 테이블의 이름을 약칭으로 쓴다. girl_group as gg
--                                    song as s 
-- INNER JOIN : A와 B의 교집합
SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg
  INNER JOIN song s
  ON s.song_id = gg.hit_song_id;
-- LEFT OUTER JOIN : A와 B에서 A 내용 전부를 가져옴.
SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg
  LEFT OUTER JOIN song s
  ON s.song_id = gg.hit_song_id
-- RIGHT OUTER JOIN : A와 B에서 B 내용 전부를 가져옴.
SELECT s.song_id, s.title, gg.name
FROM girl_group gg
  RIGHT OUTER JOIN song s
  ON s.song_id = gg.hit_song_id;
-- FULL OUTER JOIN : A와 B의 모든 조합(교집합 제외)
SELECT s.song_id, s.title, gg.name
FROM girl_group gg
  JOIN song s
  ON s.song_id <> gg.hit_song_id;
-- CROSS JOIN : A와 B의 곱집합( A테이블 갯수 * B테이블 갯수 만큼 나옴)
SELECT s.song_id, s.title, gg.name
FROM girl_group gg
CROSS JOIN song s;
-- CROSS JOIN : 윗엣것과 결과가 같음.
SELECT s.song_id, s.title, gg.name
FROM girl_group gg, song s;
-- SELF JOIN : A와 A의 곱집합( A테이블 갯수 * A테이블 갯수 만큼 나옴)
SELECT gg1.name , gg1.debut
FROM girl_group gg1, girl_group gg2
-- 검색결과 ROW - 카운트 세기
-- girl_group 총 16개
-- song 총 11개
-- 16*11 = 176
SELECT COUNT(*)
FROM girl_group gg, song s;
-- girl_group 총 16개
-- song 총 11개
-- 11*11 = 121
SELECT COUNT(*)
FROM girl_group gg1, girl_group gg2;
SELECT *
-- innerjoin을 간략히 표현
FROM girl_group gg, song s
WHERE gg.hit_song_id = s.song_id;
SELECT *
-- (+) : 조건에 포함되지않는 데이터도 추가
FROM girl_group gg, song s
WHERE gg.hit_song_id = s.song_id(+);
--
SELECT *
FROM girl_group gg, song s
WHERE  gg.hit_song_id = s.song_id and gg.hit_song_id IS NOT NULL;
-- EQUI JOIN - 값을 일치시켜 두개의 테이블을 연결하는 기본 조인방법
SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg, song s
WHERE s.song_id = gg.hit_song_id;
-- NON-EQUI JOIN - 값을 비교하면서 두개의 테이블을 연결하는 조인방법
SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg, song s;

SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg, song s
WHERE s.song_id <> gg.hit_song_id;

SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg
  LEFT OUTER JOIN song s
  ON s.song_id = gg.hit_song_id
WHERE gg.girl_group_id IS NOT NULL;
유혁의 개발 스토리유혁의 개발 스토리
[MySQL] Join 깔끔한 이해와 사용법
상단의 그림 정말 정리가 잘 되어 있습니다. 처음 접할 때 보고도 저게뭔가 싶었는데 초심자의 입장에서 이해하기 쉽도록 설명해보려합니다. 1. LEFT JOIN A, B 테이블 중에 A값의 전체와, A의 KEY 값과 B KEY..
2018년 11월 12일 (162kB)
https://yoo-hyeok.tistory.com/98

-- ANSI JOIN 기준으로
-- 1. LEFT INCLUSIVE JOIN
--  A 집합
SELECT COUNT(*) 
FROM girl_group gg
LEFT OUTER JOIN song s
ON gg.hit_song_id = s.song_id;
SELECT gg.girl_group_id, gg.name, gg.hit_song_id, s.title, s.song_id
FROM girl_group gg
LEFT OUTER JOIN song s
ON gg.hit_song_id = s.song_id;
-- Oracle에서만 
SELECT gg.girl_group_id, gg.name, s.title
FROM girl_group gg, song s
WHERE gg.hit_song_id = s.song_id(+);
-- 2. LEFT EXCLUSIVE JOIN
-- A - (A ^ B)교집합
SELECT COUNT(*) 
FROM girl_group gg
LEFT OUTER JOIN song s
ON gg.hit_song_id = s.song_id
WHERE s.song_id IS NULL;
-- Oracle에서만 
SELECT COUNT(*) 
FROM girl_group gg, song s
WHERE gg.hit_song_id = s.song_id(+) 
AND s.song_id IS NULL;
-- 3. FULL OUTER INCLUSIVE JOIN
-- A + B 합집합
SELECT COUNT(*) 
FROM girl_group gg
FULL OUTER JOIN song s
ON gg.hit_song_id = s.song_id;
-- Oracle에서 사용할 수 없음
-- SELECT COUNT(*) 
-- FROM girl_group gg, song s
-- WHERE gg.hit_song_id(+) = s.song_id(+);
-- DM으로 제출해주세요~
-- 4. INNER JOIN
SELECT COUNT(*) 
FROM girl_group gg
INNER JOIN song s
ON gg.hit_song_id = s.song_id;
-- Oracle에서만
SELECT COUNT(*)
FROM girl_group gg, song s
WHERE gg.hit_song_id = s.song_id;
-- 5. FULL OUTER EXCLUSIVE JOIN
SELECT COUNT(*) 
FROM girl_group gg
FULL OUTER JOIN song s
ON gg.hit_song_id = s.song_id
WHERE gg.hit_song_id IS NULL 
OR s.song_id IS NULL;
-- 6. RIGHT EXCLUSIVE JOIN
SELECT COUNT(*) 
FROM girl_group gg
RIGHT OUTER JOIN song s
ON gg.hit_song_id = s.song_id
WHERE gg.hit_song_id IS NULL;
-- Oracle에서만 
SELECT COUNT(*) 
FROM girl_group gg, song s
WHERE gg.hit_song_id(+) = s.song_id 
AND gg.hit_song_id IS NULL;
-- 7. RIGHT INCLUSIVE JOIN
SELECT COUNT(*) 
FROM girl_group gg
RIGHT OUTER JOIN song s
ON gg.hit_song_id = s.song_id;
-- Oracle 에서만
SELECT COUNT(*) 
FROM girl_group gg, song s
WHERE gg.hit_song_id(+) = s.song_id;
-- 8. CROSS JOIN
-- A와 B의 곱조합( A테이블 갯수 * B테이블 갯수 만큼 나옴)
-- A * B = 11 * 16 = 176개 
SELECT COUNT(*)
FROM girl_group gg
CROSS JOIN song s;
-- Oracle 에서만
SELECT COUNT(*)
FROM girl_group gg, song s;
-- 9. SELF JOIN
-- A와 A의 곱집합( A테이블 갯수 * A테이블 갯수 만큼 나옴)
-- A * A = 11 * 11 = 121
SELECT COUNT(*)
FROM girl_group gg
CROSS JOIN girl_group gg;
-- Oracle 에서만
SELECT COUNT(*)
FROM girl_group gg1, girl_group gg2;