CREATE TABLE car(
	carnum 	varchar2(20) PRIMARY KEY,
	brand 	varchar2(200),
	color 	varchar2(200),
	price	number(10)
);

SELECT * FROM car;

INSERT  INTO car ( carnum, brand, color, price)
VALUES ('1', 'Benz', 'Black', 100000000);

INSERT  INTO car ( carnum, brand, color, price)
VALUES ('2', 'Benz', 'Black', 200000000);

SELECT *
FROM CAR 
WHERE CARNUM = 3;