SELECT * FROM "_USER"; 


------------게시판

CREATE TABLE tbl_board(
	boardnum	number(10) PRIMARY KEY,
	boardtitle	varchar2(300),
	boardcontent	varchar2(4000),
	username	varchar2(300),
	boarddate	DATE,
	boardreadcount	NUMBER(10)
);

SELECT * FROM tbL_board;

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1;