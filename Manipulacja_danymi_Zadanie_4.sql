/* 1. Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Imię
Nazwisko
Wiek
Kurs
*/
USE Pracownicy;
DROP TABLE Pracownicy;
CREATE TABLE Pracownicy (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(63),
    Nazwisko VARCHAR(63),
    Wiek TINYINT unsigned,
    Kurs VARCHAR(31)
);

-- 3. Każdą tabelę uzupełnij danymi z załącznika, lub zaktualizuj.
INSERT INTO Pracownicy (Imie, Nazwisko, Wiek, Kurs) VALUES
  ('Anna','NOWAK',34,'DS.'),
  ('Roman','KOWALSKI',42,'DS.'),
  ('Tomasz','WIŚNIEWSKI',33,'DS.'),
  ('Agata ','WÓJCIK',43,'DS.'),
  ('Elżbieta','KOWALCZYK',28,'Java'),
  ('Przemysław','KOWALCZYK',34,'Java'),
  ('Robert','kOWALCZYK',35,'Java'),
  ('Radosław','ZIELIŃSKI',38,'Java'),
  (NULL,'WOŹNIAK',26,'Java'),
  ('Robert','SZYMAŃSKI',34,'Java'),
  ('Radosław','DĄBROWSKI',35,NULL),
  ('Robert','KOZŁOWSKI',NULL,'UX'),
  ('Joanna','MAZUR',26,'UX'),
  ('Radosław','JANKOWSKI',27,'UX'),
  ('Patryk','LEWANDOWSKI',28,'Tester'),
  (NULL,'ZIELIŃSKI',28,'Tester'),
  ('Andrzej','WOŹNIAK',31,'Tester'),
  ('Andrze','LEWANDOWSKI',30,'Tester'),
  ('Roman','KOWALCZYK',39,'Tester'),
  ('Ewa','WOŹNIAK',31,'Tester');

-- 4. Wyświetl listę pracowników o Imieniu: Anna.
SELECT * FROM Pracownicy WHERE Imie = 'Anna';

-- 5. Wyświetl listę pracowników z brakującą daną w kolumnie Imię.
SELECT * FROM Pracownicy WHERE Imie IS NULL;

-- 6. Wyświetl kursy prowadzone przez pracowników w wieku od 30 lat do 40 lat.
SELECT kurs FROM Pracownicy WHERE kurs IS NOT NULL AND (wiek >= 30 AND wiek <= 40) GROUP BY kurs;

-- 7. Wyświetl wiek pracowników z ID od 1 do 7.
SELECT wiek FROM Pracownicy WHERE ID <= 7;

-- 8. Wyświetl listę pracowników z brakującymi danymi w kolumnie wiek.
SELECT * FROM Pracownicy WHERE wiek IS NULL;

-- 9. Zmień nazwę kolumny „Kurs” na „Szkolenie”.
ALTER TABLE Pracownicy RENAME COLUMN Kurs TO Szkolenie;
