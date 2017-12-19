def ecrire_colonne(distribution, fichier):
    """ Ecrit dans un fichier chaque mot en clef de distribution avec la fréquence associée
    dans un fichier donné.
    
    :param distibution: Dictionnaire où la clef est un mot et la valeur le nombre d'occurrence
    :type distribution: dict
    :param fichier: Fichier ouvert pour l'écriture
    :type fichier: TextIOWrapper
    """
    fichier.write("Mot;Distribution\n")
    for mot, frequence in distribution.items():
        fichier.write(mot + ";" + str(frequence) + '\n')

# Ouvrir le fichier et stocker son contenu
with open("data/horace.txt") as fichier_ecrit:
    texte = fichier_ecrit.read()

# Nettoyer le texte
ponctuation = '!@#$%^&*()_+={}[]:;"\|<>,.?/~`\t'
texte = texte.lower()
for marqueur in ponctuation:
    texte = texte.replace(marqueur, '')
texte = texte.replace("'", " ").replace("-", " ").replace("\n"," ")

'''
pour aller plus vite : 
- .split() : coupe sur les espaces, les sauts de lignes et les tabulations. Donc on pouvait se contenter de remplacer tous les signes de ponctuation par des espaces. Ensuite split aurait tout nettoyé.
'''

# Calculer la distribution
liste_mots = texte.split()

dict_frequence = {}
for mot in liste_mots:
    if mot not in dict_frequence:
        dict_frequence[mot]= liste_mots.count(mot)

# Ouvrir le fichier `frequence_horace.txt` pour écrire
with open ("resultats/frequence_horace.txt", mode="w") as fichier_texte:
# Utiliser la fonction ecrire_colonne pour écrire dans ce fichier
    ecrire_colonne(dict_frequence, fichier_texte)

'''
Remarque : il fallait faire des fonctions pour chaque étape !
'''
