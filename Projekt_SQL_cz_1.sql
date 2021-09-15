-- PROJEKT ZALICZENIOWY SQL 
-- PRZYGOTOWANIE BAZY DANYCH, TABEL I ZAWARTOŚCI

-- 1. Stwórz Bazę „Sklep odzieżowy”
CREATE DATABASE Sklep_odziezowy;
USE Sklep_odziezowy;

/*2. Utwórz tabelę „Dostawca” z kolumnami:
Id producenta
Nazwa producenta
Adres producenta
Nip producenta
Data podpisania umowy z producentem
*/

CREATE TABLE Dostawcy (
	ID_dost INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nazwa_dost VARCHAR(63) NOT NULL UNIQUE,
    Adres_dost TEXT NOT NULL,
    NIP_dost VARCHAR(14) NOT NULL,
    Data_podpisania_umowy DATE
);


/*3. Utwórz tabelę „Produkt” z kolumnami:
id produktu
nazwa producenta
nazwa produktu
opis produktu
cena netto zakupu
cena brutto zakupu
cena netto sprzedaży
cena brutto sprzedaży
procent VAT sprzedaży
*/

CREATE TABLE Produkty (
	ID_prod INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Nazwa_dost VARCHAR(63) NOT NULL,
    Nazwa_prod VARCHAR(63) NOT NULL,
    Opis_prod TEXT,
    Zakup_netto FLOAT NOT NULL,
    Zakup_brutto FLOAT,
    Sprzedaz_netto FLOAT NOT NULL,
    Sprzedaz_brutto FLOAT,
    Vat TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (Nazwa_dost) REFERENCES Dostawcy(Nazwa_dost)
);


/*5. Utwórz tabelę „Klient” z kolumnami:
Id klienta
Id zamówienia
Imię
Nazwisko
adres
*/

CREATE TABLE Klienci (
	ID_klient INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_zam INT UNSIGNED,
    Imie VARCHAR(63) NOT NULL,
    Nazwisko VARCHAR(63) NOT NULL,
    Adres TEXT
);


/*4. Utwórz tabelę „Zamówienie” z kolumnami:
Id zamówienia
Id klienta
Id produktu
Data zamówienia
*/

CREATE TABLE Zamowienia (
	ID_zam INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_klient INT UNSIGNED NOT NULL,
    ID_prod INT UNSIGNED NOT NULL,
    Data_zamowienia DATE NOT NULL,
    FOREIGN KEY (ID_klient) REFERENCES Klienci(ID_klient),
    FOREIGN KEY (ID_prod) REFERENCES Produkty(ID_prod)
);    


/*6. Każdą tabelę uzupełnij danymi wg:
Tabela „Dostawca” – 4 pozycje
Tabela „Produkt” – 20 pozycji
Tabela „Zamówienie” – 10 pozycji
Tabela „Klient” – 10 pozycji
*/

-- SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/producenci.csv'
INTO TABLE dostawcy
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nazwa_dost, Adres_dost, NIP_dost, Data_podpisania_umowy);

-- SELECT * FROM dostawcy;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/produkty.csv'
INTO TABLE produkty
FIELDS TERMINATED BY ';'
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nazwa_dost, Nazwa_prod, Opis_prod, Zakup_netto, @z, Sprzedaz_netto, @s, Vat)
SET Zakup_brutto = REPLACE(@z, ',', '.'), Sprzedaz_brutto = REPLACE(@s, ',', '.');

-- SELECT * FROM produkty;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/klienci.csv'
INTO TABLE klienci
FIELDS TERMINATED BY ';'
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_zam, Imie, Nazwisko, Adres);
-- SELECT * FROM klienci;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/zamowienia.csv'
INTO TABLE zamowienia
FIELDS TERMINATED BY ';'
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_klient, ID_prod, Data_zamowienia);
-- SELECT * FROM zamowienia;

/*7. Połącz kolumny ze Sobą aby tabele ze sobą się Komunikowały
Produkt – Dostawca
Produkt – Zamówienie
Zamówienie - Klient
*/

ALTER TABLE Klienci
ADD FOREIGN KEY (ID_zam) REFERENCES Zamowienia(ID_zam);





