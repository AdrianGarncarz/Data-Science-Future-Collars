-- PROJEKT ZALICZENIOWY SQL 
-- ZADANIA Z WYŚWIETLANIEM DANYCH
/*
SELECT * FROM dostawcy;
SELECT * FROM klienci;
SELECT * FROM produkty;
SELECT * FROM zamowienia;
*/
USE sklep_odziezowy;

-- 8. Wyświetl wszystkie produkty z wszystkimi danymi od dostawcy
-- który znajduje się na pozycji 1 w tabeli „Dostawca”

SELECT p.ID_prod AS 'ID produktu', p.nazwa_prod AS 'Nazwa produktu',
	   d.nazwa_dost AS 'Dostawca', d.adres_dost AS 'Adres dostawcy',
	   d.NIP_dost AS 'NIP dostawcy', d.data_podpisania_umowy AS 'Data podpisania umowy'
FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1;


-- 9. Posortuj te produkty po Nazwie od A-B

SELECT p.ID_prod AS 'ID produktu', p.nazwa_prod AS 'Nazwa produktu',
	   d.nazwa_dost AS 'Dostawca', d.adres_dost AS 'Adres dostawcy',
	   d.NIP_dost AS 'NIP dostawcy', d.data_podpisania_umowy AS 'Data podpisania umowy'
FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1
ORDER BY p.nazwa_prod;


-- 10. Wylicz średnią cenę za produkty od tego dostawcy

SELECT d.nazwa_dost AS 'Dostawca', ROUND(AVG(p.zakup_brutto), 2) AS 'Średnia cena produktu brutto'
FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1;


/*11. Wyświetl dwie grupy produktów tego dostawcy:
Połowa najtańszych to grupa: „Tanie”
Pozostałe to grupa: „Drogie”
*/

SELECT AVG(p.zakup_netto) FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1;

SELECT concat(p.nazwa_dost, " ", p.nazwa_prod) AS 'Produkt', p.zakup_netto, 'Tanie' AS 'Grupa cenowa'
FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1 AND p.zakup_netto < 242
UNION ALL
SELECT concat(p.nazwa_dost, " ", p.nazwa_prod) AS 'Produkt', p.zakup_netto, 'Drogie' AS 'Grupa cenowa'
FROM produkty AS p
JOIN dostawcy AS d
ON p.nazwa_dost = d.nazwa_dost
WHERE d.ID_dost = 1 AND p.zakup_netto > 242;


-- 12. Wyświetl produkty zamówione, wyświetlając nazwę, 

SELECT concat(p.nazwa_prod, ' ', p.nazwa_dost) AS 'Nazwa produktu', z.ID_zam AS 'Numer zamowienia'
FROM produkty AS p
RIGHT JOIN zamowienia AS z
ON p.id_prod = z.id_prod;


-- 13. Wyświetl wszystkie produkty zamówione – ograniczając do wyświetlonych 5 pozycji

SELECT concat(p.nazwa_prod, ' ', p.nazwa_dost) AS 'Nazwa produktu', z.ID_zam AS 'Numer zamowienia'
FROM produkty AS p
RIGHT JOIN zamowienia AS z
ON p.id_prod = z.id_prod
LIMIT 5;


-- 14. Policz wartość wszystkich zamówień

SELECT ROUND(SUM(p.sprzedaz_netto), 2) AS 'Wartosć zamówień netto',
	   ROUND(SUM(p.sprzedaz_brutto), 2) AS 'Wartosć zamówień brutto'
FROM produkty AS p
RIGHT JOIN zamowienia AS z
ON p.id_prod = z.id_prod;


-- 15. Wyświetl wszystkie zamówienia wraz z produktami sortując je wg daty od najstarszego do najnowszego

SELECT z.ID_zam AS 'Numer zamówienia', concat(p.nazwa_prod, ' ', p.nazwa_dost) AS 'Nazwa produktu',
	   z.data_zamowienia AS 'Data zamówienia'
FROM zamowienia AS z
JOIN produkty AS p
ON z.ID_prod = p.ID_prod
ORDER BY z.data_zamowienia ASC;


-- 16. Sprawdź czy w tabeli produkty masz uzupełnione wszystkie dane – wyświetl pozycje dla których brakuje danych

SELECT * FROM produkty
WHERE (nazwa_prod OR nazwa_dost OR opis_prod OR zakup_netto OR zakup_brutto
OR sprzedaz_brutto OR sprzedaz_netto OR sprzedaz_brutto OR vat) IS NULL;


-- 17. Wyświetl produkty najczęściej sprzedawane wraz z ich ceną

SELECT count(z.id_prod) AS 'Liczba zamówień',
	   concat(p.nazwa_dost, ' ', p.nazwa_prod) AS 'Nazwa produktu',
       p.sprzedaz_netto AS 'Cena netto', p.sprzedaz_brutto AS 'Cena brutto'
FROM produkty AS p
RIGHT JOIN zamowienia AS z
ON p.id_prod = z.id_prod
GROUP BY z.id_prod
ORDER BY COUNT(z.id_prod) DESC;


-- 18. Znajdź dzień w którym najwięcej zostało złożonych zamówień

SELECT count(z.id_prod) AS 'Liczba zamówień', z.data_zamowienia
FROM zamowienia AS z
GROUP BY z.data_zamowienia
ORDER BY 'Liczba zamówień' DESC
LIMIT 1;

-- lub w poniższej formie, ale wtedy nie wyświetli się żadne zamówienie, jeśli w każdy dzień było ich tyle samo

SELECT count(z.id_prod) AS 'Liczba zamówień', z.data_zamowienia
FROM zamowienia AS z
GROUP BY z.data_zamowienia
HAVING MAX('Liczba zamówień');

