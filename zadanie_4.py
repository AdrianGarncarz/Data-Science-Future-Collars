# Python - Zadanie 4 - Część wspólna list
# Napisz funkcję, która dla dwóch list liczbowych zwróci listę zawierającą tylko te elementy, które należą do obydwu list wejściowych.


def czesc_wspolna(lista1, lista2):
  for i in lista1:
    for j in lista2:
      if i == j:
        print(j)


# przykładowe wartości:

przyklad = [3, "g", 12, "cos"]
przyklad2 = [15, "ala", 3, "cos"]

czesc_wspolna(przyklad, przyklad2)


# i jeśli nie ma wspólnej części, to nic się nie drukuje:

przyklad3 = [0, 22]

czesc_wspolna(przyklad, przyklad3)