-- 1 Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
USE Pracownicy;

/* 2 Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Imię
Nazwisko
Wiek
Kurs
*/
DROP TABLE IF EXISTS Pracownicy;
CREATE TABLE Pracownicy (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(63),
    Nazwisko VARCHAR(63),
    Wiek INT,
    Kurs VARCHAR(31) NOT NULL
);

-- 3. Każdą tabelę uzupełnij danymi z załącznika lub zaktualizuj.
INSERT INTO Pracownicy (Imie,Nazwisko ,Wiek,Kurs) VALUES 
  ('Anna','NOWAK',34,'DS.'),
  ('Roman','KOWALSKI',42,'DS.'),
  ('Tomasz','WIŚNIEWSKI',33,'DS.'),
  ('Agata ','WÓJCIK',43,'DS.'),
  ('Elżbieta','KOWALCZYK',28,'Java'),
  ('Przemysław',NULL,34,'Java'),
  ('Robert',NULL,35,'Java'),
  ('Radosław','ZIELIŃSKI',38,'Java'),
  (NULL,'WOŹNIAK',26,'Java'),
  ('Robert','SZYMAŃSKI',34,'Java'),
  ('Radosław','DĄBROWSKI',35,''),
  ('Robert','KOZŁOWSKI',NULL,'UX'),
  ('Joanna','MAZUR',26,'UX'),
  ('Radosław','JANKOWSKI',27,'UX'),
  ('Patryk','LEWANDOWSKI',28,'Tester'),
  (NULL,'ZIELIŃSKI',28,'Tester'),
  ('Andrzej','WOŹNIAK',31,'Tester'),
  ('Andrze','LEWANDOWSKI',30,'Tester'),
  ('Roman',NULL,39,'Tester'),
  ('Ewa','WOŹNIAK',31,'Tester')
;

-- 4. Wyświetl listę pracowników w wieku 28 lat.
SELECT * FROM Pracownicy WHERE Wiek = 30;

-- 5. Wyświetl listę pracowników w wieku 30 lat i młodszych.
SELECT * FROM Pracownicy WHERE Wiek <= 30;

-- 6. Wyświetl listę pracowników, których nazwisko zawiera „ski”.
SELECT * FROM Pracownicy WHERE Nazwisko LIKE '%ski%';

-- 7. Wyświetl listę pracowników z ID: 1,4,7,18,20.
SELECT * FROM Pracownicy
WHERE ID=1 OR ID=4 OR ID=7 OR ID=18 OR ID=20;

-- 8. Wyświetl listę pracowników z wprowadzonymi kompletnymi danymi.
SELECT * FROM Pracownicy WHERE
Imie IS NOT NULL
AND Nazwisko IS NOT NULL
AND Wiek IS NOT NULL
AND Kurs IS NOT NULL;

-- 9. Wyświetl wszystkich pracowników, którzy nie prowadzą kursu DS
SELECT * FROM Pracownicy
WHERE Kurs NOT LIKE 'DS.';

