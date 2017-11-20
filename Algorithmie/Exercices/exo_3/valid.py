print("""Exercice 3.2 : Validation des donnees
Ecrire un algorithme compris entre 1 et 3""")
nb=input("donnez un nombre : ")
while((nb>3) or (nb<1)):
    pint("Erreur")
    nb=int(input("donnez un nombre : "))
print("Merci")
