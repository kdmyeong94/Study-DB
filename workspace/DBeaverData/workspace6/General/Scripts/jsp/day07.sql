SELECT * FROM CAR c ;

CREATE TABLE MEMBER(
NAME varchar2(20),
AGE  NUMBER(10)
);

INSERT INTO MEMBER VALUES ('김자바', 22);
INSERT INTO MEMBER VALUES ('홍길동', 32);
INSERT INTO MEMBER VALUES ('이순신', 42);

SELECT age FROM MEMBER WHERE name ='이순신'; 



CREATE TABLE tbl_MEMBER(
	userid		varchar2(200) PRIMARY KEY,
	userpw  	varchar2(200),
	username 	varchar2(200),
	usergender  varchar2(100),
	userphone	varchar2(100),
)
