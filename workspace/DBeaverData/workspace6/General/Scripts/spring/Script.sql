CREATE TABLE member(
	id number(10) PRIMARY KEY,
	name	varchar2(600)
);		

CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO MEMBER VALUES (member_seq.nextval,'spring');

SELECT * FROM MEMBER;
