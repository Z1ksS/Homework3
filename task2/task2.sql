INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES 
	('Аналіз 6', 100.0, 150.0, 1), 
	('Аналіз 7', 200.0, 300.0, 1), 
	('Аналіз 8', 50.0, 85.0, 1),
	('Аналіз 9', 75.0, 90.0, 2),
	('Аналіз 11', 150.0, 215.0, 2),
	('Аналіз 12', 150.0, 215.0, 3),
	('Аналіз 13', 150.0, 215.0, 3),
	('Аналіз 14', 150.0, 215.0, 3);

INSERT INTO Orders (ord_datetime, ord_an) VALUES
  ('2021-03-05 10:00:00', 6),
  ('2021-03-15 10:30:00', 7),
  ('2021-04-06 12:00:00', 8),
  ('2021-03-06 14:00:00', 9),
  ('2021-03-10 16:00:00', 10),
  ('2021-03-15 16:00:00', 11),
  ('2021-04-10 16:00:00', 12),
  ('2021-04-12 16:00:00', 13),
  ('2021-04-15 16:00:00', 13);

--Creating CTE, which will calculate number of sales by month and year
WITH analysis_sold AS (
  SELECT 
    YEAR(ord.ord_datetime) as year,
	MONTH(ord.ord_datetime) as month,
    analys.an_group as groups,
    COUNT(ord.ord_an) AS analysis_sold
  FROM Orders ord
  JOIN Analysis analys ON ord.ord_an = analys.an_id
  JOIN Groups groups ON analys.an_group = groups.gr_id
  GROUP BY 
    YEAR(ord.ord_datetime),
	MONTH(ord.ord_datetime),
    analys.an_group
),
--Creating CTE which will calculate cumulative sales total
cumulative_analysis_sold AS (
  SELECT 
	year,
	month,
	groups,
	analysis_sold,
	SUM(analysis_sold) OVER (
		PARTITION BY groups
		ORDER BY year, month
	) AS cumulative_analysis_sold
	FROM analysis_sold
)

SELECT year, month, groups, cumulative_analysis_sold 
FROM cumulative_analysis_sold 
ORDER BY groups, year, month;