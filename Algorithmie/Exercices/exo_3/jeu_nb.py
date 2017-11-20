import random
nbSecret = random.randint(1,100)
nbEntre = int(input("Tentez un nombre : "))
chance = int(9)
for i in range (1,11):
	if(nbEntre==nbSecret):
		print("Bravo!")
		break
	if(nbEntre<nbSecret):
		print("Trop petit !")
		print("Essais restants : ", chance, "\n")
		chance = chance -1
		nbEntre = int(input("Tentez un nouveau nombre : "))
	if(nbEntre>nbSecret):
		print("Trop grand!")
		print("Essais restants : ", chance, "\n")
		chance = chance -1
		nbEntre = int(input("Tentez un nouveau nombre : "))
print("La partie est finie !")
