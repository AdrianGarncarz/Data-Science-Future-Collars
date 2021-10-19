# Python - Zadanie 4 - Część wspólna list
# Napisz funkcję, która dla dwóch list liczbowych zwróci listę zawierającą tylko te elementy, które należą do obydwu list wejściowych.


def czesc_wspolna(lista1, lista2):
  nowa_lista = []
  for i in lista1:
    for j in lista2:
      if i == j:
        nowa_lista.append(j)
        break
  return(nowa_lista)


# przykładowe wartości:

przyklad = [3, "g", 12, "cos"]
przyklad2 = [15, "ala", 3, "cos", "cos"]

print(czesc_wspolna(przyklad, przyklad2))


# i jeśli nie ma wspólnej części, to drukuje pustą listę:

przyklad3 = [0, 22]

print(czesc_wspolna(przyklad, przyklad3))