--Task 1
SELECT an_name, an_price 
FROM dbo.Analysis analys
JOIN dbo.Orders ord ON analys.an_id = ord.ord_id
WHERE ord.ord_datetime BETWEEN '2020-02-05' AND DATEADD(day, 7, '2020-02-05');
