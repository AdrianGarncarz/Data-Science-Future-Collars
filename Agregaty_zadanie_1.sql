-- agregaty zadanie 1.

USE aggregates;

-- a. Policz, ile jest rekordów w tabeli (po id).
SELECT COUNT(ID) FROM batman;

-- b. Policz, ile jest rekordów z wiekiem.
SELECT COUNT(age) FROM batman;

-- c. Ilu mężczyzn ma więcej niż 40 lat?
SELECT COUNT(age) FROM batman
WHERE age > 40 AND sex = 'M';

-- d. Oblicz sumę wszystkich cen.
SELECT SUM(price) FROM batman;

-- e. Oblicz łączny wiek kobiet.
SELECT SUM(age) FROM batman
WHERE sex = 'F';

-- f. Podaj łączną wartość komputera i okna.
SELECT SUM(price) FROM batman
WHERE gift = 'komputer' OR gift = 'okno';

-- g. Podaj maksymalną cenę.
SELECT MAX(price) FROM batman;

-- h. Podaj najpóźniejszą datę
SELECT MAX(start_date) FROM batman;

-- i. Podaj nazwisko rozpoczynające się literą, która jest najbliżej końca alfabetu
SELECT MAX(last_name) FROM batman;

-- j. Podaj minimalną cenę.
SELECT MIN(price) FROM batman;

-- k. Podaj najwcześniejszą datę
SELECT MIN(start_date) FROM batman;

-- l. Podaj nazwisko rozpoczynające się literą, która jest najbliżej początku alfabetu
SELECT MIN(last_name) FROM batman;

-- m. Jednocześnie podaj cenę minimalną oraz maksymalną. Nadaj odpowiednie aliasy.
SELECT MIN(price) AS 'Najniższa cena', MAX(price) AS 'Najwyższa cena'
FROM batman;

-- n. Oblicz różnicę pomiędzy ceną maksymalną, a minimalną.
SELECT (MAX(price) - MIN(price)) AS różnica FROM batman;

-- o. Oblicz średnią wieku.
SELECT AVG(age) AS 'średnia wieku' FROM batman;

-- p. Oblicz średnią wieku za pomocą COUNT oraz SUM.
SELECT (SUM(age) / COUNT(age)) AS 'srednia wieku' FROM batman;

-- q. Oblicz średni wiek dla kobiet oraz średni wiek dla mężczyzn.
SELECT sex AS 'płeć', AVG(age) AS 'średnia wieku'
FROM batman GROUP BY sex;



