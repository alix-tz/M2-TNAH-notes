print("Exercice 2.3")
motA = (input("Premier mot:"))
motB = (input("Deuxième mot:"))
if(motA<motB):
	print("résultat", motB, motA)
else:
	print("résultat", motA, motB)

####################################

print("Exercice 2.4")
a = float(input("premier nombre :"))
b = float(input("deuxieme nombre :"))
if((a*b)<0):
	print("le produit est négatif")
else:
	print("le produit est positif")

####################################

print("Exercice 2.4 v2")
a = float(input("premier nombre :"))
b = float(input("deuxieme nombre :"))
c = float(a*b)
if(c<0):
	print("le produit est négatif")
else:
	print("le produit est positif")

####################################

print("Exercice 2.4 v3")
a = float(input("premier nombre :"))
b = float(input("deuxieme nombre :"))
c = float(a*b)
if(c<0):
	print("le produit est négatif")
elif(c==0):
	print("le produit est nul")
else:
	print("le produit est positif")

####################################

print("Exercice 2.5")
note1 = float(input("votre note :"))
note2 = float(input("la note de votre voisin :"))
if(note1<note2):
	print("bouh !")
else:
	print("Bravo !")

####################################

print("Exercice 2.6")
age = int(input("Donnez un age :"))
if(age>13):
	print("Catégorie CADET")
elif(age>13 and age<9):
	print("Catégorie : MINIME")
elif(age>10 and age<7):
	print("Catégorie : PUPILLE")
elif(age>8 and age<5):
	print("Catégorie : POUSSIN")
else:
	print("Hors catégorie")

####################################

print("Exercice 2.7")
nbA = float(input("Premier nombre :"))
nbB = float(input("Deuxième nombre :"))
oper = (input("Opération :"))
if(oper == "+"):
	print(nbA+nbB)
elif(oper == "-"):
	print(nbA-nbB)
elif(oper == "*"):
	print(nbA*nbB)
elif(oper == "/"):
	print(nbA/nbB)
else:
	print("opérateur invalide.")

####################################

print("Exercice 2.8")
nbcopie = int(input("Combien de copies souhaitez-vous réaliser ?"))
total = 0.0
if(nbcopie<=10):
	total=nbcopie*0.10
else:
	total=1
	nbcopie=nbcopie-10
	if(nbcopie<=20):
		total=total+(nbcopie*0.09)
	else:
		total=total+1.8
		nbcopie=nbcopie-20
		total=total+(nbcopie*0.08)
print("Prix à payer :", total)

####################################
