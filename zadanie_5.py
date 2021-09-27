# Python - Zadanie 5 - Urodziny
# Napisz funkcję, która zwróci które urodziny będą obchodziły w tym roku osoby urodzone w latach podanych w liście będącej argumentem wejściowym danej funkcji.

# najpierw importuję bibliotekę, która pozwoli mi na ustawienie zmiennej odpowiadającej aktualnemu roku

from datetime import datetime


# definiuję fukncję z uwzględnieniem tego, czy dany rok jest z przeszłości czy przyszłości

def ktore_urodziny(lista):
  obecny_rok = datetime.now().year
  for i in lista:
    if i < obecny_rok:
      print("Osoba urodzona w " + str(i) + " obchodzi w tym roku " + str((obecny_rok - i)) + " urodziny")
    elif i == obecny_rok:
      print("Osoba urodzona w " + str(i) + " dopiero się urodziła.")
    else:
      print("Rok " + str(i) + " jeszcze nie nastąpił i ta osoba jeszcze się nie urodziła")




# sprawdzam na dwóch przykładach czy działa

przyklad = [1956, 1994, 1999, 2000]

ktore_urodziny(przyklad)

ktore_urodziny([1900, 2023, 12, 2021, -50])