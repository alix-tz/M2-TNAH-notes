print("""Exercice 3.5 : Table de Multiplication en double boucle""")
x = 1
y = 1
for i in range(1,11):
    for j in range(1,11):
        print(y*x)
        x= x+1
    y= y+1
    x= 1
    print("\n")
