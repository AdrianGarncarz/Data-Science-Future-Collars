-- 1. Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
USE Pracownicy;
DROP TABLE IF EXISTS Pracownicy;

/* 2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Imię
Nazwisko
Wiek
Kurs
*/
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

-- 4. Wyświetl listę pracowników o Nazwisku: KOWALCZYK.
SELECT * FROM Pracownicy WHERE Nazwisko = 'Kowalczyk';

-- 5. Wyświetl listę pracowników w wieku od 30 lat do 40 lat.
SELECT * FROM Pracownicy WHERE Wiek >= 30 AND Wiek <= 40;

-- 6. Wyświetl listę pracowników, których nazwisko nie zawiera „and”.
SELECT * FROM Pracownicy WHERE Nazwisko NOT LIKE '%and%';

-- 7. Wyświetl listę pracowników z ID od 1 do 7.
SELECT * FROM Pracownicy WHERE ID <= 7;

-- 8. Wyświetl listę pracowników z brakującymi danymi.
SELECT * FROM Pracownicy WHERE
Imie IS NULL
OR Nazwisko IS NULL
OR Wiek IS NULL
OR Kurs IS NULL;

-- 9. Wyświetl wszystkich pracowników, którzy nie prowadzą żadnego kursu.
SELECT * FROM Pracownicy WHERE Kurs IS NULL;