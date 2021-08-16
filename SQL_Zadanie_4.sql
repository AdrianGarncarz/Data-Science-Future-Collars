-- zadanie 4. SQL

-- tworzę bazę oraz tabelę
CREATE DATABASE Lista_prezentów;
USE Lista_prezentów;
CREATE TABLE Prezenty_2020(
	ID INTEGER PRIMARY KEY,
    Imię TEXT NOT NULL,
    Pomysł_na_prezent TEXT,
    Cena INTEGER,
    Miejsce_zakupu TEXT
);

-- dodaję 5 pozycji z pomysłami na prezenty
INSERT INTO Prezenty_2020 VALUES (1, 'Cyryl', 'Książka', 29, 'Empik');
INSERT INTO Prezenty_2020 VALUES (2, 'Mikołaj', 'Kalendarz', 35, 'Empik');
INSERT INTO Prezenty_2020 VALUES (3, 'Agnieszka', 'Zestaw do akwareli', 60, 'Matejko');
INSERT INTO Prezenty_2020 VALUES (4, 'Sylwia', 'Książka', 29, 'Empik');
INSERT INTO Prezenty_2020 VALUES (5, 'Alex', 'Kapcie-pingwiny', 40, 'Nie wiem');

-- sprawdzam, czy wszystko jest tak jak powinno
SELECT * FROM Prezenty_2020;

-- zmieniam pomysł na prezent dla osoby pod ID 3 i sprawdzam, czy się zmieniło jak trzeba
UPDATE Prezenty_2020 SET Pomysł_na_prezent = 'Rower', Cena = 300 WHERE ID = 3;
SELECT Pomysł_na_prezent, Cena FROM PRezenty_2020 WHERE ID = 3;

-- usuwam pierwszą pozycję i sprawdzam, że ID pozostały takie jakie były (tylko brakuje numeru 1)
DELETE FROM Prezenty_2020 WHERE ID = 1;
SELECT * FROM Prezenty_2020;

-- usuwam kolumnę z miejscem zakupu
ALTER TABLE Prezenty_2020 DROP Miejsce_zakupu;

-- wyświetlam zawartość "imię" dla pozycji 3,4,5
SELECT Imię FROM Prezenty_2020 WHERE ID>=3 AND ID<=5;