-- agregaty zadanie 4

USE aggregates;
-- a. Podaj średnią wieku. Podaj zaokrąglony wynik do dwóch miejsc po przecinku.
SELECT ROUND(AVG(age), 2) AS 'średnia wieku' FROM batman;

-- b. Wyświetl wartość bezwzględną liczby -3.
SELECT ABS(-3);

-- c. Wyświetl wynik mnożenie 2 * 3
SELECT (2*3);

-- d. Wyświetl wynik dzielenia 6 przez 2
SELECT (6/2);
