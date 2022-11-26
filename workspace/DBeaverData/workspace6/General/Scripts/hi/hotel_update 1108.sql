CREATE TABLE users(
	u_name		varchar2(100),
	u_id 		varchar2(100) 	PRIMARY KEY,
	u_password	varchar2(100),
	u_phone		varchar2(100),
	u_email		varchar2(100),
	u_status	varchar2(100)	DEFAULT '1'
);

UPDATE 	USERS SET 
				u_name 		= '최익현',				
				u_password 	= '1234',
				u_phone 	= '01012345678',
				u_email 	= 'test@test.com',
				u_status 	= '1'
			WHERE u_id = 'test';
		

--DROP TABLE USERS ;

CREATE TABLE room(
	r_id 		number(35)	PRIMARY KEY,
	r_type 		varchar2(100),
	r_capacity	number(35),
	r_price		number(35),
	r_img		varchar2(1000)
);


CREATE TABLE reservation(
	res_number		number(35)	PRIMARY key,
	u_id 			varchar2(100),
	res_adults		number(35),
	res_kids		number(35),
	res_checkin		DATE,
	res_checkout	DATE,
	res_rtype		varchar2(100),
	res_price		number(35),
	res_time 		date,
	r_id 			number(35),
	CONSTRAINT res_u_id_fk FOREIGN KEY(u_id) REFERENCES users(u_id),
	CONSTRAINT res_r_id_fk FOREIGN KEY(r_id) REFERENCES room(r_id)
);

--DROP TABLE reservation;
--DROP SEQUENCE res_no_seq;

CREATE SEQUENCE res_no_seq
START WITH 1
INCREMENT BY 1;


CREATE TABLE reservationcancel(
	res_number		number(35),
	u_id 			varchar2(100),
	res_checkin		DATE,
	res_checkout	DATE,
	res_rtype		varchar2(100),
	res_price		number(35),
	cancel_date		DATE,
	CONSTRAINT resc_res_number FOREIGN KEY(res_number) REFERENCES reservation(res_number) 
);


CREATE TABLE board(
	b_number	number(35)	PRIMARY KEY,
	b_title		varchar2(100),
	b_writer	varchar2(100),
	b_date		DATE,
	b_content	varchar2(100),
	b_readCnt	number(35)
);


CREATE TABLE "COMMENT"(
	b_number	number(35),
	c_number	number(35) 		PRIMARY KEY,
	c_comment	varchar2(100),
	c_date		DATE,
	CONSTRAINT comm_b_number_fk FOREIGN KEY(b_number) REFERENCES board(b_number)
);

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE comment_seq
START WITH 1 
INCREMENT BY 1;

--DROP SEQUENCE comment_seq;
--TRUNCATE TABLE RESERVATION ;
--DROP TABLE BOARD;

INSERT INTO USERS VALUES ('admin', 'admin', '1234', '010-1111-2222', 'admin@admin.com', '9');

UPDATE USERS SET U_NAME = ddd , U_ID =ddd WHERE U_NAME = 

