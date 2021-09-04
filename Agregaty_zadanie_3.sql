-- agregaty zadanie 3

USE aggragates;
-- a. Rozłóż datę pokazaną w kolumnie start_date na trzy kolumny: rok, miesiąc, dzień.
SELECT YEAR(start_date), MONTH(start_date), DAY(start_date) FROM batman;

-- b. Wyświetl kolumnę start_date oraz kolumnę final_date, która wyświetli datę o 3 dni późniejszą, niż data w start_date.
SELECT start_date, DATE_ADD(start_date, INTERVAL 3 DAY) AS 'final_date' FROM batman;

-- c. Wyświetl dzisiejszą datę.
SELECT CURRENT_DATE();

-- d. Wyświetl nazwę obecnego miesiąca.
SELECT MONTHNAME(CURRENT_DATE()) AS 'aktualny miesiąc';

-- e. Wyświetl start_date, a następnie kolumny określające:
-- numer tygodnia, nazwę miesiąca, kwartał, numer dnia w roku.
SELECT start_date,
WEEK(start_date) AS 'numer tygodnia',
MONTHNAME(start_date) AS 'nazwa miesiąca',
QUARTER(start_date) AS 'kwartał',
DAYOFYEAR(start_date) AS 'dzień roku'
FROM batman;