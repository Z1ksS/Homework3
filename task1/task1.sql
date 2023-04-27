--Створення таблиць
CREATE TABLE Groups (
	gr_id INT PRIMARY KEY,
	gr_name VARCHAR(50) NOT NULL,
	gr_temp VARCHAR(20)
);

CREATE TABLE Analysis (
	an_id INT PRIMARY KEY,
	an_name VARCHAR(50) NOT NULL,
	an_cost DECIMAL(10,2) NOT NULL,
	an_price DECIMAL(10,2) NOT NULL,
	an_group INT NOT NULL,
	FOREIGN KEY (an_group) REFERENCES Groups(gr_id)
);

CREATE TABLE Orders(