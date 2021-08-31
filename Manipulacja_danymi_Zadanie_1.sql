-- Bazy danych i manipulacja danymi, zadanie 1.


-- 1. Stwórz Bazę Pracownicy.
CREATE DATABASE Pracownicy;
USE Pracownicy;

/* 2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID, Imię, Nazwisko, Wiek, Kurs
*/
CREATE TABLE Pracownicy (
	ID INT AUTO_INCREMENT PRIMARY KEY,
	Imie VARCHAR(63) NOT NULL,
    Nazwisko VARCHAR(63) NOT NULL,
    Wiek INT,
    Kurs VARCHAR(31)
);

-- 3. Każdą tabelę uzupełnij danymi z tabeli z załącznika.
INSERT INTO Pracownicy (Imie, Nazwisko, Wiek, Kurs) VALUES 
  ('Anna','NOWAK',34,'DS.'),
  ('Roman','KOWALSKI',42,'DS.'),
  ('Tomasz','WIŚNIEWSKI',33,'DS.'),
  ('Agata ','WÓJCIK',43,'DS.'),
  ('Elżbieta','KOWALCZYK',28,'Java'),
  ('Przemysław','KAMIŃSKI',34,'Java'),
  ('Robert','LEWANDOWSKI',35,'Java'),
  ('Radosław','ZIELIŃSKI',38,'Java'),
  ('Anna','WOŹNIAK',26,'Java'),
  ('Robert','SZYMAŃSKI',34,'Java'),
  ('Radosław','DĄBROWSKI',35,'UX'),
  ('Robert','KOZŁOWSKI',38,'UX'),
  ('Joanna','MAZUR',26,'UX'),
  ('Radosław','JANKOWSKI',27,'UX'),
  ('Patryk','LEWANDOWSKI',28,'Tester'),
  ('Patryk','ZIELIŃSKI',28,'Tester'),
  ('Andrzej','WOŹNIAK',31,'Tester'),
  ('Andrze','LEWANDOWSKI',30,'Tester'),
  ('Roman','ZIELIŃSKI',39,'Tester'),
  ('Ewa','WOŹNIAK',31,'Tester');

-- 4. Wyświetl listę pracowników starszych niż 30 lat.
SELECT * FROM Pracownicy
WHERE Wiek > 30;

-- 5. Wyświetl listę pracowników młodszych niż 30 lat.
SELECT * FROM Pracownicy
WHERE Wiek < 30;

-- 6. Wyświetl listę pracowników, których nazwisko zaczyna się na „K” i kończy na „ki”
SELECT * FROM Pracownicy
WHERE Nazwisko LIKE 'K%ki';

-- 7. Zmień nazwę kolumny „ID” na „NR”
ALTER TABLE Pracownicy
RENAME COLUMN ID TO NR;

-- 8. Wyświetl pozycje, w których są puste pola.
SELECT * FROM Pracownicy WHERE Imie IS NULL or Nazwisko IS NULL or Wiek IS NULL or Kurs IS NULL;

-- 9. Wyświetl wszystkich pracowników z kursu „Java”.
SELECT * FROM Pracownicy WHERE Kurs = 'Java';