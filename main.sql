--Creating tables
CREATE TABLE Groups (
	gr_id INT IDENTITY(1,1) PRIMARY KEY,
	gr_name VARCHAR(50) NOT NULL,
	gr_temp DECIMAL(3,1) NOT NULL
);

CREATE TABLE Analysis (
	an_id INT IDENTITY(1,1) PRIMARY KEY,
	an_name VARCHAR(50) NOT NULL,
	an_cost DECIMAL(10,1) NOT NULL,
	an_price DECIMAL(10,1) NOT NULL,
	an_group INT NOT NULL,
	FOREIGN KEY (an_group) REFERENCES Groups(gr_id)
);

CREATE TABLE Orders(
	ord_id INT IDENTITY(1,1) PRIMARY KEY,
	ord_datetime DATETIME NOT NULL,
	ord_an INT NOT NULL,
	FOREIGN KEY (ord_an) REFERENCES Analysis(an_id)
);

--Filling tables with data
INSERT INTO Groups(gr_name, gr_temp) VALUES 
	('Group A', 40.0), 
	('Group Á', 45.0), 
	('Group Â', 35.0);
INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES 
	('Analysis 1', 100.0, 150.0, 1), 
	('Analysis 2', 200.0, 300.0, 1), 
	('Analysis 3', 50.0, 85.0, 2),
	('Analysis 4', 75.0, 90.0, 3),
	('Analysis 5', 150.0, 215.0, 3);
INSERT INTO Orders (ord_datetime, ord_an) VALUES
  ('2020-02-04 10:00:00', 1),
  ('2020-02-05 11:00:00', 2),
  ('2020-02-07 09:00:00', 3),
  ('2020-02-10 12:00:00', 4),
  ('2020-02-11 16:00:00', 5);