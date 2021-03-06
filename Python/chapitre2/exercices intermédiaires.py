#Exercice 1

def numeroter_poeme(chemin_de_fichier):
   with open(chemin_de_fichier) as a_numeroter:
        liste_vers = a_numeroter.read()
    liste_vers = liste_vers.split('\n') 
        
    i = 1
    texte_numerote = []
        
    for vers in liste_vers:
        if vers != '':
            vers = str(i) + ('\t') + vers
            i += 1
            texte_numerote.append(vers)
        
    return texte_numerote

# Code pour tester le résultat
poeme = numeroter_poeme("data/lanuitdelamort.michel.txt")

assert "5\tJamais, jamais le dernier jour" in poeme
assert "13\tElle monte et les couvrira." in poeme

#Exercice 2

def numeroter_poeme(chemin_de_fichier):
    # Ecrire le code ici
    with open(chemin_de_fichier) as a_numeroter:
        liste_vers = a_numeroter.read()
        
    liste_vers = liste_vers.split('\n') 
    
    i = 1
    tuples_list = []
        
    for vers in liste_vers:
        if vers != '':
            tup = (i, vers);
            tuples_list.append(tup)
            i += 1
        
    return tuples_list 

# Code pour tester le résultat
poeme = numeroter_poeme("data/lanuitdelamort.michel.txt")

assert (5, "Jamais, jamais le dernier jour") == poeme[4]
assert (13, "Elle monte et les couvrira.") == poeme[12]


#Exercice 2bis

def numeroter_poeme_avec_strophe(chemin):
    # Ecrire le code ici
    with open(chemin) as fichier:
        liste_vers = fichier.read()
        
    liste_vers = liste_vers.split('\n')
    
    i = 1
    tup_list = []
    strophes = []
        
    for vers in liste_vers:
        if vers != '':
            tup = (i, vers);            
            tup_list.append(tup)
            i += 1
        else:
            strophes.append(tup_list)
            tup_list = []
    strophes.append(tup_list)
    
    return strophes
        
        
poeme = numeroter_poeme_avec_strophe("data/Ballade.XXVIII.dePisan.txt")

assert poeme[0] == [(1, 'Mon doulz ami, vueilliez moy pardonner,'),
  (2, 'Se je ne puis, si tost com je vouldroye,'),
  (3, 'Parler a vous, car ainçois ordener'),
  (4, 'Me fault comment sera, ne par quel voye.'),
  (5, 'Car mesdisans me vont gaitant'),
  (6, 'Qui du meschief et du mal me font tant,'),
  (7, 'Que je ne puis joye ne bien avoir,'),
  (8, 'Pour le desir que j’ay de vous veoir.')]
assert poeme[-1][0] == (17, 'Mais ne sçaront ja eulx si fort pener,')


Exercice 3

def debat(chemin):
    # Ecrire ici
    with open (chemin) as fichier_a_lire:
        fichier = fichier_a_lire.read()
    
    fichier_decomp = fichier.split('\n')
    
    line_index = 1
    text_sorted = []
    
    for line in fichier_decomp:
        if line.startswith("FOLIE"):
            line = line.replace('FOLIE. ', '')
            tup = (line_index, "réplique", "FOLIE", line);
            text_sorted.append(tup)
            line_index += 1
        elif line.startswith("AMOUR"):
            line = line.replace('AMOUR. ', '')
            tup = (line_index, "réplique", "AMOUR", line);
            text_sorted.append(tup)
            line_index += 1
        else:
            if line != '':
                tup = (line_index, "didascalie", False, line);
                text_sorted.append(tup)
                line_index += 1
    return text_sorted
    
    
    
# Tests
resultats = debat("data/debat.folieamour.labbe.txt")
assert isinstance(resultats, list) == True, "Le resultat doit être une liste"
assert resultats[3] == (
    4,
    "réplique",
    "AMOUR",
    "II n'en ira pas ainsi : car avant que tu m'eschapes, je te donneray à connoitre que tu ne te dois atacher à moy."
)
assert resultats[16] == (
    17,
    "didascalie",
    False,
    "Folie se fait invisible, tellement, qu'Amour ne la peut assener."
)
assert resultats[8] == (
    9,
    "réplique",
    "FOLIE",
    "Tu es Amour, fils de Venus."
)

