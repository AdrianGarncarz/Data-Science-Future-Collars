

-- 1. Załóż bazę o nazwie: Moje zainteresowania.
CREATE DATABASE Moje_zainteresowania;
USE Moje_zainteresowania;

/*2. Załóż tabelę o nazwie: Zainteresowanie.
3. Utwórz 5 kolumn, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Nazwa 
Opis
Data realizacji */
CREATE TABLE Zainteresowanie(
	ID INTEGER AUTO_INCREMENT,
    Nazwa VARCHAR(63),
    Opis VARCHAR(255),
    Data_realizacji DATE,
    PRIMARY KEY (ID)
    );

-- 4. Wprowadź dane dla kolumn: Nazwa i Opis. (Min 5 pozycji)
INSERT INTO Zainteresowanie (Nazwa, Opis) VALUES
('Szycie', 'Stroje kąpielowe dla lalek'),
('Szydełkowanie', 'Płaszcz dla lalek'),
('Kolorowanie', 'Kolorowanka Olsikowej'),
('Czytanie', "Si-woo's Sight"),
('Robienie biżuterii', 'Biżuteria dla lalek');

-- 5. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo i co pojawia się w kolumnie ID i Data realizacji.
SELECT * FROM Zainteresowanie;

-- 6. Dodaj nową pozycję wypełniając wszystkie dane.
INSERT INTO Zainteresowanie (Nazwa, Opis, Data_realizacji) VALUES
('Oglądanie', 'The Good Doctor', '2021-12-31');

-- 7. Dodaj brakujące dane dla wiersza  4.
UPDATE Zainteresowanie SET Data_realizacji = '2021-08-23' WHERE ID = 4;

-- 8. Sprawdź, czy dane zostały zmienione, wyświetlając wszystkie pozycje.
SELECT * FROM Zainteresowanie;

-- 9. Usuń wszystkie wiersze, w których jakaś z pozycji jest pusta.
DELETE FROM Zainteresowanie WHERE Data_realizacji = NULL;

-- 10. Sprawdź, czy dane zostały zmienione.
SELECT * FROM Zainteresowanie;


