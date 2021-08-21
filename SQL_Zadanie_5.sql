-- zadanie 5

-- 1. Załóż bazę o nazwie: Lista Pracowników.
CREATE DATABASE Lista_pracowników;
USE Lista_pracowników;

/* 2. Załóż tabelę o nazwie: Pracownicy.
3. Utwórz 5 kolumn, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID, Imię, Nazwisko, Stanowisko, Dział
*/
CREATE TABLE Pracownicy(
	ID INTEGER AUTO_INCREMENT,
    Imię VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Stanowisko VARCHAR(50) NOT NULL DEFAULT 'Specjalist_a',
    Dział VARCHAR(50) NOT NULL DEFAULT 'Główny',
    PRIMARY KEY (ID)
);

-- 4. Wprowadź dane osób, z którymi pracujesz w Swojej firmie. Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem.
INSERT INTO Pracownicy (Imię, Nazwisko) VALUES
('Adam', 'Adamski'),
('Bartosz', 'Bartek'),
('Cecylia', 'Cebula'),
('Dominika', 'Daniel');


-- 5. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo.
SELECT * FROM Pracownicy;

-- 6. Dodaj kolumnę: Data zatrudnienia.
ALTER TABLE Pracownicy ADD Data_zatrudnienia YEAR;


-- 7. Dodaj nowego pracownika uzupełniając wszystkie dane.
INSERT INTO Pracownicy (Imię, Nazwisko, Data_zatrudnienia) VALUES
('Ewa', 'Nowak', 2021);

-- 8. Sprawdź, czy dane zostały zmienione, wyświetlając wszystkie pozycje. Zwróć uwagę na dane w kolumnie Data zatrudnienia.
SELECT * FROM Pracownicy;

-- 9. Uzupełnij wszystkie brakujące dane w kolumnie o nazwie Data Zatrudnienia.
UPDATE Pracownicy SET Data_zatrudnienia = 2020 WHERE ID = 1;
UPDATE Pracownicy SET Data_zatrudnienia = 2019 WHERE ID = 2 OR ID = 4;
UPDATE Pracownicy SET Data_zatrudnienia = 2021 WHERE ID = 3;

-- 10. Sprawdź, czy dane zostały zmienione, zwróć uwagę, co się zmieniło w kolumnie ID.
-- nic się nie zmieniło w kolumnie ID (?)
SELECT * FROM Pracownicy;