print("""Exercice 3.3 : Calculatrice améliorée
	MENU : 
	+ : addition
	- : soustraction
	/ : division sans reste
	* : multiplication
	q : quitter le programme""")
while True:
	oper = (input("opérateur :"))
	if(oper == "q"):
		print("Fermeture du programme. A bientôt !")
		break
	nbA = int(input("premier nombre entier :"))
	nbB = int(input("deuxième nombre  entier :"))
	if(oper == "+"):
		print("		Résultat : ",nbA+nbB)
	elif(oper == "-"):
		print("		Résultat : ",nbA-nbB)
	elif(oper == "*"):
		print("		Résultat : ",nbA*nbB)
	elif(oper == "/"):
		print("		Résultat : ",nbA/nbB)
	else:
		print("/!\ opérateur invalide. /!\ ")
	print("""
	
	____________NOUVELLE OPERATION____________
		MENU : 
		+ : addition
		- : soustraction
		/ : division sans reste
		* : multiplication
		q : quitter le programme""")



