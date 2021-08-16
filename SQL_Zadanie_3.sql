-- zadanie 3. SQL

-- najpierw tworzę bazę oraz tabelę w tej bazie
CREATE DATABASE School_Coding;
USE School_Coding;
CREATE TABLE Mentors(
	ID INTEGER PRIMARY KEY,
    Imię TEXT NOT NULL,
    Nazwisko TEXT NOT NULL,
    Specjalizacja TEXT NOT NULL,
    Data_zatrudnienia DATE NOT NULL,
    Data_zwolnienia DATE
);

-- Uzupełniam dane    
INSERT INTO Mentors VALUES (1, 'Adam', 'Adamski', 'SQL', '2018-06-15', NULL);
INSERT INTO Mentors VALUES (2, 'Bartosz', 'Bartłomiej', 'Python', '2016-07-05', '2019-07-05');
INSERT INTO Mentors VALUES (3, 'Cyryl', 'Cebula', 'Python', '2019-07-05', NULL);
INSERT INTO Mentors VALUES (4, 'Dominika', 'Domaszewksa', 'C++', '2015-06-01', NULL);
INSERT INTO Mentors VALUES (5, 'Ewa', 'Elżbieta', 'Statystyka', '2014-03-20', '2015-08-31');
INSERT INTO Mentors VALUES (6, 'Filip', 'Fabisiak', 'Statystyka', '2015-08-31', '2016-12-10');
INSERT INTO Mentors VALUES (7, 'Grażyna', 'Górska', 'Statystyka', '2017-01-02', '2017-12-31');
INSERT INTO Mentors VALUES (8, 'Halina', 'Hrobra', 'Machine Learning', '2019-06-15', NULL);
INSERT INTO Mentors VALUES (9, 'Irena', 'Izop', 'Statystyka', '2018-03-15', '2019-05-01');
INSERT INTO Mentors VALUES (10, 'Jan', 'Nowak', 'Statystyka', '2019-06-15', '2020-07-03');

-- sprawdzam, czy wszystko zostało dodane prawidłowo
SELECT * FROM Mentors;

-- zmieniam nawisko osoby pod numerem 5 i sprawdzam, czy zostało zmienione prawidłowo
UPDATE 	Mentors SET Nazwisko = 'Elżbietańska' WHERE Id = 5;
SELECT Nazwisko FROM Mentors WHERE Id = 5;

-- zmieniam specjalizację osoby pod numerem 9 i sprawdzam, czy zostało zmienione prawidłowo
UPDATE Mentors SET Specjalizacja = 'Data Sciene' WHERE Id = 9;
SELECT Specjalizacja FROM Mentors WHERE Id = 9;

-- dodaję kolumnę Wynagrodzenie, ustawiam wynagrodzenie dla pierwszych 3 pozycji i sprawdzam, czy jest prawidłowo
ALTER TABLE Mentors ADD Wynagrodzenie INTEGER NOT NULL;
UPDATE Mentors SET Wynagrodzenie = 1000 WHERE Id > 0 AND Id < 4;
SELECT * FROM Mentors WHERE Id < 4;

