# Python - Zadanie 2 - Liczby pierwsze
# Napisz funkcję, która wypisze wszystkie liczby pierwsze mniejsze od liczby będącej argumentem funkcji.



def liczby_pierwsze(n):
  for n in range(1,n):
   if n > 1:
    for i in range(2,int((n/2)+1)):
      if (n % i) == 0:
        break
    else:
        print(n)
  else:
    print("Brak liczb pierwszych mniejszych od wprowadzonej liczby")



# tutaj użyłem fukcji "print" zamiast "return", ponieważ w przypadku "return" pojawia się tylko pierwsza liczba


# wywołanie fukcji:


print("Program wyświetla wszystkie liczby pierwsze poniżej wprowadzonej liczby.")
liczba = int(input("Wprowadź liczbę: "))

liczby_pierwsze(liczba)