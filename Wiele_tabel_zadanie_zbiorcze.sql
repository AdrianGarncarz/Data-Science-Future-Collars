-- WIELE TABEL
-- Wprowadzenie
USE wiele_tabel;
/*
SELECT * FROM agents;
SELECT * FROM company;
SELECT * FROM customer;
SELECT * FROM daysorder;
SELECT * FROM despatch;
SELECT * FROM foods;
SELECT * FROM listofitem;
SELECT * FROM orders;
*/
-- a. Napisz kwerendę, która zwróci wszystkich klientów z zamówieniami zrealizowanymi w dniu 2008-01-08

SELECT customer.cust_name, orders.ord_date
FROM customer
JOIN orders
ON customer.cust_code = orders.cust_code
WHERE ord_date = '2008-01-08';

-- b. Napisz kwerendę, która zwróci listę agentów oraz klientów wraz z ich obszarem działalności, którzy należą do tego samego obszaru

 SELECT agents.working_area, agents.agent_name, customer.cust_name
 FROM agents
 JOIN customer
 ON agents.working_area = customer.working_area
 ORDER BY working_area, agent_name, cust_name;


-- INNER JOIN
-- a. Wyszukaj listę klientów, którzy podjęli współpracę z agentami spoza swojego obszaru działalności
-- oraz tymi, których prowizja jest powyżej 12%;
-- kolumna z nazwą pośrednika powinna mieć nazwę „Salesman”
SELECT c.cust_name, c.working_area AS customer_wa, a.working_area AS agent_wa, a.agent_name AS 'Saleseman', a.commission
FROM customer AS c
JOIN agents AS a
ON c.agent_code = a.agent_code
WHERE a.commission > 0.12 OR c.working_area != a.working_area
ORDER BY c.cust_name;


-- b. Wyszukaj szczegóły dot. Zamówień: nr zamówienia, datę, kwotę, klienta
-- (nazwa kolumny powinna być „Customer Name”) oraz agenta (w tym wypadku nazwa kolumny to „Salesman”),
-- który pracuje dla tego klienta oraz jego prowizję od zamówienia

SELECT o.ord_num AS 'Order number', o.ord_date AS 'Order date', o.ord_amount AS 'Order amount',
c.cust_name AS 'Customer name', a.agent_name AS 'Salesman', ROUND(a.commission*o.ord_amount, 2) AS 'Commission'
FROM orders AS o
JOIN customer AS c ON o.cust_code = c.cust_code
JOIN agents AS a ON o.agent_code = a.agent_code;


-- LEFT JOIN
-- a. Wyszukaj listę - posortowaną rosnąco wg kodu klienta (jego id) – klientów pracujących
-- zarówno indywidualnie, jak również za pośrednictwem pośredników
-- (nazwij kolumnę zawierającą nazwy pośredników jako „Salesman”), 
-- wyszukaj również ich obszar działalności

SELECT c.cust_code AS 'Customer ID', c.cust_name AS 'Customer name',
a.agent_name AS 'Salesman', c.working_area AS 'Working Area'
FROM customer AS c
LEFT JOIN agents AS a
ON c.agent_code = a.agent_code
ORDER BY c.cust_code;

 
-- RIGHT JOIN
-- a. Wyszukaj listę pośredników pracujących dla jednego bądź więcej klientów lub takich,
-- którzy jeszcze nie podjęli współpracy z żadnym klientem,
-- posortuj listę rosnąco wg kolumny kodu pośrednika (agenta);
-- nazwij kolumnę zawierającą nazwy pośredników jako „Salesman”,
-- wyszukaj również ich obszar działalności

SELECT a.agent_code AS 'Agent code', a.agent_name AS 'Salesman',
a.working_area AS 'Working area', c.cust_name AS 'Customer name'
FROM customer AS c
RIGHT JOIN agents AS a
ON c.agent_code = a.agent_code
ORDER BY 'Agent code';


 
-- CROSS JOIN
-- a. Wyszukaj iloczyn kartezjański pośredników oraz klientów,
-- w taki sposób, że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa.

SELECT customer.cust_name AS 'Costumer', agents.agent_name AS 'Salesman'
FROM customer
CROSS JOIN agents;


-- b. Wyszukaj iloczyn kartezjański pośredników oraz klientów,
-- w taki sposób, że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa,
-- ale tylko jeżeli pośrednik jest z tego samego obszaru co klient.

SELECT customer.cust_name AS 'Costumer', agents.agent_name AS 'Salesman'
FROM customer
CROSS JOIN agents
WHERE customer.working_area = agents.working_area;


-- c. Wyszukaj iloczyn kartezjański pośredników oraz klientów,
-- w taki sposób, że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa,
-- ale tylko jeżeli pośrednik jest z innego obszaru niż klient,
-- a klient posiada swoją własną ocenę (‘grade’)

SELECT customer.cust_name AS 'Costumer', agents.agent_name AS 'Salesman'
FROM customer
CROSS JOIN agents
WHERE customer.working_area != agents.working_area AND customer.grade > 0;

 
-- UNION
-- a. Wyszukaj wszystkich pośredników (ich kod – nazwij kolumne „ID” oraz nazwa agenta);
-- przypisz im wartość ‘Salesman’ w kolumnie o nazwie „Rodzaj”)
-- oraz klientów – ich ID i nazwa (wartość ‘Customer’ w kolumnie „Rodzaj”) zlokalizowanych w Londynie

SELECT agent_code AS 'ID', agent_name AS 'Nazwa', 'Salesman' AS 'Rodzaj'
FROM agents
WHERE working_area = 'London'
UNION
SELECT cust_code AS 'ID', cust_name AS 'Nazwa', 'Customer' AS 'Rodzaj'
FROM customer
WHERE working_area = 'London';


-- b. Napisz kwerendę, która zwróci raport pokazujący,
-- który pośrednik przyjął największe i najmniejsze zamówienia na każdy dzień

(SELECT ord_date, agent_code, ord_amount
FROM orders
GROUP BY ord_date
HAVING MAX(ord_amount)
UNION ALL
SELECT ord_date, agent_code, ord_amount
FROM orders
GROUP BY ord_date
HAVING MIN(ord_amount))
ORDER BY ord_date;

 
-- WITH
-- a. Wyszukaj pośrednika w Londynie z prowizją powyżej 14% - nazwij widok „londonstaff”

WITH londonstaff AS (
	SELECT agent_name, commission
    FROM agents
    WHERE commission > 0.14 AND working_area = 'London'
)
SELECT * FROM londonstaff;
    

-- b. Utwórz widok „gradecount”, aby uzyskać liczbę klientów dla każdej oceny (‘grade’)

WITH gradecount AS (
	SELECT COUNT(cust_code) AS 'Liczba klientów', grade AS 'Ocena'
    FROM customer
    GROUP BY grade
)
SELECT * FROM gradecount;
    

-- c. Utwórz widok (o nazwie „total_per_dzien”) do śledzenia liczby klientów,
-- średniej kwoty zamówień oraz ogólnej sumy zamówień na każdy dzień

WITH total_per_dzien AS (
	SELECT ord_date AS 'Data', COUNT(cust_code) AS 'Liczba klientów',
    ROUND(AVG(ord_amount), 2) AS 'Średnia wartość zamówienia', COUNT(ord_num) AS 'Liczba zamówień'
    FROM orders
    GROUP BY ord_date
    ORDER BY ord_date
)
SELECT * FROM total_per_dzien;


