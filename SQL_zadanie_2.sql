-- zadanie 2. SQL

CREATE DATABASE zadanie_2;
-- tworzę bazę danych na początek

USE zadanie_2;
-- wybieram bazę danych, na której będę pracował
 
 DROP TABLE IF EXISTS Biblioteczka;
CREATE TABLE Biblioteczka(
	ID INTEGER PRIMARY KEY,
    Tytuł TEXT,
    Data_zakupu DATE
);
-- tworzę tabelę Biblioteczka z kolumnami: ID, Tytuł, Data zakupu w formacie YYYY-MM-DD

INSERT INTO Biblioteczka VALUES (1, 'Zwiadowcy', '2015-05-15');
-- dodaję pierwszą ulubioną książkę

SELECT * FROM Biblioteczka;
-- sprawdzam, czy wszystko wygląda tak, jak powinno

INSERT INTO Biblioteczka VALUES (2, 'Statystycznie rzecz biorąc', '2021-07-05');
INSERT INTO Biblioteczka VALUES (3, 'Patolodzy na klatce', '2018-10-13');
-- dodaję dwie kolejne książki do biblioteczki

SELECT * FROM Biblioteczka;
-- sprawdzam, czy wszystko wygląda tak, jak powinno

UPDATE Biblioteczka SET Tytuł = 'Patolodzy na klatce', Data_zakupu = '2018-10-13' WHERE ID = 1;
-- aktualizuję ulubioną książkę na tą, która mi się najmniej podoba

ALTER TABLE Biblioteczka ADD Autor_ka TEXT; 
-- dodaję nową kolumnę

SELECT * FROM Biblioteczka;
-- sprawdzam, czy wszystko wygląda tak, jak powinno

UPDATE Biblioteczka SET Autor_ka = 'Paulina Łopatniuk' WHERE Tytuł = 'Patolodzy na klatce';
UPDATE Biblioteczka SET Autor_ka = 'Janina Bąk' WHERE Tytuł = 'Statystycznie rzecz biorąc';
-- dodaję autorów do konkretnych książek
-- wybieram tytuł jako warunek, ponieważ jest moim zdaniem bardziej stały niż ID

SELECT * FROM Biblioteczka;
-- sprawdzam, czy wszystko wygląda tak, jak powinno

DELETE FROM Biblioteczka WHERE ID < 3;
-- usuwam wszystkie książki poza najmniej ulubioną

SELECT Autor_ka FROM Biblioteczka WHERE ID=3;
-- wyświetlam autor_kę książki, która została




