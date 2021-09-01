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
  ('Anna',NULL,43,'DS.'),
  ('Elżbieta','KOWALCZYK',NULL,'Tester'),
  ('Anna','KOWALCZYK',NULL,'Java'),
  ('Robert','KOWALCZYK',NULL,'Java'),
  ('Radosław','ZIELIŃSKI',NULL,'Java'),
  ('Robert','WOŹNIAK',NULL,'Java'),
  ('Robert','SZYMAŃSKI',34,'Tester'),
  ('Radosław','DĄBROWSKI',35,NULL),
  ('Robert','KOZŁOWSKI',NULL,'UX'),
  ('Joanna','MAZUR',26,'UX'),
  ('Radosław','JANKOWSKI',27,'UX'),
  ('Patryk','LEWANDOWSKI',28,NULL),
  (NULL,'ZIELIŃSKI',28,NULL),
  ('Andrzej','WOŹNIAK',31,NULL),
  ('Andrze','LEWANDOWSKI',30,NULL),
  ('Roman','KOWALCZYK',39,NULL),
  ('Ewa','WOŹNIAK',31,NULL);

-- 4. Wyświetl listę pracowników wg kolumny Imię, eliminując powtarzające się pozycje.
SELECT DISTINCT * FROM Pracownicy GROUP BY Imie;

-- 5. Wyświetl listę pracowników wg kolumny Nazwisko eliminując powtarzające się pozycje.
SELECT * FROM Pracownicy GROUP BY Nazwisko ORDER BY Nazwisko ASC;

-- 6. Wyświetl kursy prowadzone przez pracowników o Nazwisku: „Kowalczyk”.
SELECT Kurs FROM Pracownicy WHERE Nazwisko = 'Kowalczyk';

-- 7. Wyświetl listę pracowników, dla których nie znamy wieku.
SELECT * FROM Pracownicy WHERE Wiek IS NULL;

-- 8. Wyświetl wiek pracowników o Imieniu „Patryk”.
SELECT Wiek FROM Pracownicy WHERE Imie = 'Patryk';

-- 9. Zmień nazwę tabeli z  „Pracownicy” na „Mentorzy”
RENAME TABLE Pracownicy TO Mentorzy;


