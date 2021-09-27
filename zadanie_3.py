# Python - Zadanie 3 - Sortowanie
# Napisz funkcję, która posortuje listę liczb w porządku niemalejącym.


def sortowanie_listy(lista):
  lista.sort()
  return lista


# Przykład dla sprawdzenia

przyklad = [3, 1, 15, 4, 18, 33, 90]
print(sortowanie_listy(przyklad))