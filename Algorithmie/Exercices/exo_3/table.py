print("Exercice 3.4 : Tables de multiplication")
nombre = int(input("donner un nombre entier :"))
print("Table de ", nombre, "\n__________________\n")
for multi in range (1,11):
	print(multi ," x ", nombre ," = ", multi * nombre)
	multi = multi + 1
