import random
code = random.randint(0,9999)
print("création du code")
essai = int(0)
while (essai!=code):
	essai+= 1
if(essai<10):
	print("000", essai, sep="")
elif(essai<100):
	print("00", essai, sep="")
elif(essai<1000):
	print("0", essai, sep="")
else:
	print(essai)
	
