#préambule
print("""Echelle d’Estime de Soi de Rosenberg

L’estime de soi est définie comme le jugement ou l’évaluation que l’on fait de soi-même, de sa valeur
personnelle. De façon plus simple, l’estime de soi peut-être également assimilée à l’affirmation de soi. L’estime
de soi est un facteur essentiel dans la performance sportive. (Voir article : « encore une erreur d’arbitrage ou
comment maintenir une estime de soi positive... »

En répondant à ce test, vous pourrez ainsi obtenir une évaluation de votre estime de soi.
Pour chacune des caractéristiques ou descriptions suivantes, indiquez à quel point chacune est vraie pour vous
en encerclant le chiffre approprié.

----------------------------------

Tout à fait en désaccord : 1
Plutôt en désaccord : 2
Plutôt d'accord : 3
Tout à fait d'accord : 4

----------------------------------

""")

#initialisation d'un dictionnaire contenant les questions du test
questions = {
"1" : "1. Je pense que je suis une personne de valeur, au moins égale à n'importe qui d'autre.",
"2" : "2. Je pense que je possède un certain nombre de belles qualités.",
"3" : "3. Tout bien considéré, je suis porté à me considérer comme un raté.",
"4" : "4. Je suis capable de faire les choses aussi bien que la majorité des gens.",
"5" : "5. Je sens peu de raisons d'être fier de moi.",
"6" : "6. J'ai une attitude positive vis-à-vis moi-même.",
"7" : "7. Dans l'ensemble, je suis satisfait de moi.",
"8" : "8. J'aimerais avoir plus de respect pour moi-même.",
"9" : "9. Parfois je me sens vraiment inutile.",
"10" : "10. Il m'arrive de penser que je suis un bon à rien."
}

#initialisation d'un dictionnaire contenant l'interpretation des résultats
interpretation = {
"A" : "Très faible estime de soi, un travail dans ce domaine semble souhaitable.",
"B" : "Faible estime de soi, un travail dans ce domaine serait bénéfique.",
"C" : "Estime de soi dans la moyenne.",
"D" : "Forte estime de soi.",
"E" : "Très forte estime de soi et vous avez tendance à être fortement affirmé.e ; peut-être même un peu narcissique ?"
}

#initialisation d'une liste qui recevra les réponses
reponses = []

#début des questions
for i in range (1,11):
    j = str(i)
    print(questions[j])
    reponse = int(input(" : "))

#test de la valeur entrée avant son intégration dans la liste des réponses
    if reponse >= 1 and reponse <= 4:
        reponses.append(reponse)
    else:
        while reponse < 1 or reponse > 4:
            print("Erreur : La réponse doit être une valeur comprise entre 1, 2, 3 ou 4 !\n" + questions[j])
            reponse = int(input(" : "))
        reponses.append(reponse)

#initialisation d'une liste contenant les adresses des questions (3, 5, 8, 9 et 10) dont les réponses doivent être recalculées
inverser = [2, 4, 7, 8, 9]

for valeur in inverser:
    if reponses[valeur] == 4:
        reponses[valeur] = 1
    elif reponses[valeur] == 3:
        reponses[valeur] = 2
    elif reponses[valeur] == 2:
        reponses[valeur] = 3
    else:
        reponses[valeur] = 4

#calcul du résultat
resultat = 0
for valeur in reponses:
    resultat += reponses[valeur]

print("\n------\nTotal de points : ", resultat)
#interprétation du résultat
if resultat < 25:
    print(interpretation["A"])
elif resultat <=25 and resultat < 31:
    print(interpretation["B"])
elif resultat <= 31 and resultat < 34:
    print(interpretation["C"])
elif resultat <= 34 and resultat < 39:
    print(interpretation["D"])
else:
    print(interpretation["E"])
