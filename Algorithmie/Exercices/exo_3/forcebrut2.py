import random
code=[]
repet=int(input("quelle est la longueur du code à deviner ? -> "))
while len(code) != repet:
	code.append(random.randint(0,9))

essai=[]
while len(essai) != repet:
	essai.append(0)

for i in range (0,(repet)):
	while(code[i]!=essai[i]):
		essai[i]+= 1
result= map(str, essai)
result= " ".join(result)
print("CODE = ", result)
