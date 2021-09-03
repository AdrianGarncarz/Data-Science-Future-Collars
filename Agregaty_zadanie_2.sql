-- agregaty zadanie 2.

USE aggregates;
-- a. Wyświetl imię i nazwisko w jednej kolumnie. Kolumnie nadaj alias „Pracownik”
SELECT CONCAT(First_name, ' ', last_name) AS Pracownik FROM batman;

-- b. Złącz kolumny gift i price tak, aby powstał napis: „rower – cena: ”. Kolumnie nadaj alias: cennik.
SELECT CONCAT(gift, ' - ', price) AS cennik FROM batman;

-- c. Ponownie wykonaj zadanie 2b – doklej imię i nazwisko pracownika
SELECT CONCAT(first_name, ' ', last_name) AS pracownik,
CONCAT(gift, ' - ', price) AS cennik FROM batman;

-- d. Wyświetl prezenty. Ich nazwy mają być wyświetlane wielkimi literami.
SELECT UCASE(gift) FROM batman;

-- e. Wyświetl imiona. Mają być wyświetlane małymi literami.
SELECT LCASE(first_name) FROM batman;

-- f. Wyświetl nazwiska oraz dodatkową kolumnę „długość” zawierającą informację o liczbie liter w nazwisku.
SELECT last_name, CHAR_LENGTH(last_name) FROM batman;

-- g. Wyświetl pierwsze dwie litery imion.
SELECT MID(first_name, 1, 2) FROM batman;

-- h. Wyświetl imię, nazwisko i login użytkownika w formacie: 
-- mała litera imienia + 3 pierwsze, małe litery nazwiska.
SELECT
first_name AS imię,
last_name AS nazwisko,
CONCAT(LCASE(MID(first_name, 1, 1)), LCASE(MID(last_name, 1, 3))) AS login
FROM batman;

