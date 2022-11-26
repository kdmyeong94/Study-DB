CREATE TABLE users(
	u_name		varchar2(100),
	u_id 		varchar2(100) 	PRIMARY KEY,
	u_password	varchar2(100),
	u_phone		varchar2(100),
	u_email		varchar2(100),
	u_status	varchar2(100)	DEFAULT '1'
);

--DROP TABLE USERS ;

CREATE TABLE room(
	r_id 		number(35)	PRIMARY KEY,
	r_type 		varchar2(100),
	r_capacity	number(35),
	r_price		number(35),
	r_img		varchar2(1000)
);
--DROP TABLE room ;

SELECT *
FROM room;

CREATE SEQUENCE r_id_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE reservation(
	res_number		number(35)	PRIMARY key,
	u_id 			varchar2(100),
	res_adults		number(35),
	res_kids		number(35),
	res_checkin		varchar2(100),
	res_checkout	varchar2(100),
	res_rtype		varchar2(100),
	res_price		number(35),
	res_time 		varchar2(100),
	r_id 			number(35),
	diffday			number(35),
	totalamount		number(35),
	CONSTRAINT res_u_id_fk FOREIGN KEY(u_id) REFERENCES users(u_id),
	CONSTRAINT res_r_id_fk FOREIGN KEY(r_id) REFERENCES room(r_id)
);

SELECT *
FROM RESERVATION ;




SELECT SUBSTR(res_checkin,3,4) m, COUNT(*) 
FROM (SELECT REGEXP_REPLACE(res_checkin, '[^0-9]') res_checkin FROM RESERVATION)
GROUP BY SUBSTR(res_checkin,3,4)
;

SELECT SUBSTR(res_checkin,5,2) m, COUNT(*) 
FROM (SELECT REGEXP_REPLACE(res_checkin, '[^0-9]') res_checkin FROM RESERVATION)
GROUP BY SUBSTR(res_checkin,5,2) 
;

SELECT REGEXP_REPLACE(res_checkin, '[^0-9]') res_checkin
FROM RESERVATION;

--DROP TABLE reservation;
--DROP SEQUENCE res_no_seq;

CREATE SEQUENCE res_no_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE reservationcancel(
	res_number		number(35),
	u_id 			varchar2(100),
	res_checkin		varchar2(100),
	res_checkout	varchar2(100),
	res_rtype		varchar2(100),
	res_price		number(35),
	cancel_date		varchar2(100),
	CONSTRAINT resc_res_number FOREIGN KEY(res_number) REFERENCES reservation(res_number) 
);


--DROP TABLE reservationcancel;

CREATE TABLE board(
	b_number	number(35)	PRIMARY KEY,
	b_title		varchar2(100),
	b_writer	varchar2(100),
	b_date		varchar2(100),
	b_content	varchar2(100),
	b_readCnt	number(35)
);


CREATE TABLE "COMMENT"(
	b_number	number(35),
	c_number	number(35) 		PRIMARY KEY,
	c_comment	varchar2(100),
	c_date		varchar2(100),
	CONSTRAINT comm_b_number_fk FOREIGN KEY(b_number) REFERENCES board(b_number)
);

CREATE TABLE TBL_FILES(
	fileName		varchar2(2000) PRIMARY key,
	r_id 			number(35),
	fileNameOriginal	varchar2(2000),
	CONSTRAINT  FK_FILES_ROOM FOREIGN KEY(r_id) REFERENCES room(r_id)
);

SELECT *
FROM TBL_FILES ;

SELECT fileName
FROM TBL_FILES 
WHERE r_id = 8;



CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE comment_seq
START WITH 1 
INCREMENT BY 1;


--------- 인서트 테스트 -----------

INSERT INTO ROOM
values(r_id_seq.nextval, 'standard', 4, 200000, '"../image/스탠다드1.jpg"');

INSERT INTO ROOM 
values(r_id_seq.nextval, 'deluxe', 4, 500000, '"../image/디럭스1.jpg"');

INSERT INTO ROOM 
values(r_id_seq.nextval, 'premium deluxe', 4, 300000, '"../image/프레지던트1.jpg"');

INSERT INTO ROOM 
values(r_id_seq.nextval, 'grand', 4, 200000, '"../image/그랜드1.jpg"');

SELECT * FROM ROOM r ;

DELETE FROM room WHERE r_id = 7;
DELETE FROM TBL_FILES WHERE r_id = 7;


INSERT INTO USERS 
VALUES ('admin', 'admin', '1234', '010-1111-2222', 'admin@admin.com', '9');

INSERT INTO USERS 
VALUES  ('사용자1', 'user1','1234', '01012345678','asdf@naver.com','1');

INSERT INTO USERS 
VALUES  ('사용자2', 'user2','1234', '01012345678','asdf@naver.com','1');

INSERT INTO USERS 
VALUES  ('사용자3', 'user3','1234', '01012345678','asdf@naver.com','1');

INSERT INTO USERS 
VALUES  ('사용자4', 'user4','1234', '01012345678','asdf@naver.com','1');

INSERT INTO USERS 
VALUES ('test', '자바', 'test', '010-2458-7899', 'fdsafe@earsers.com','1');

INSERT INTO USERS 
VALUES  ('사용자5', 'user5','1234', '01012345678','asdf@naver.com','1');

SELECT * FROM users;
--DELETE FROM USERS u WHERE U_NAME = 'test';



INSERT INTO RESERVATION 
VALUES (res_no_seq.nextval, 'user5', 3, 1, '2022-1-19', '2022-1-20', 'premium deluxe', 1200000, TRUNC(SYSDATE), 3, 2, 1200000*2);


--DELETE FROM reservation WHERE U_ID = 'user3';




SELECT * FROM RESERVATION r ;
--TRUNCATE TABLE RESERVATION ;
--DROP TABLE BOARD;
--DELETE FROM RESERVATION WHERE RES_RTYPE = 'premium deluxe';



SELECT 	RES_NUMBER ,
		RES_ADULTS ,
		RES_KIDS ,
		RES_CHECKIN,
		RES_CHECKOUT,
		RES_RTYPE,
		RES_PRICE,
		RES_TIME 
FROM RESERVATION WHERE U_ID ='user4'	
;


SELECT count(*) FROM RESERVATION WHERE U_ID ='user4';

SELECT *
FROM RESERVATION r 
INNER JOIN USERS u 
	ON r.U_ID = u.U_ID 
WHERE RES_CHECKIN >= SYSDATE 
AND u.U_ID = 'test1'
;

select r_id_seq.CURRVAL from dual;


SELECT *
FROM ROOM r
INNER JOIN TBL_FILES F 
	ON r.r_id = f.r_id
WHERE r.r_id = 8;