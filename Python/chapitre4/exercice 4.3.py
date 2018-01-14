def iiif_csv(ark, nom_csv):
    colonnes = ["Numéro", "Nom de Page", "Lien image", "Largeur", "Longueur"]
    # Complétez avec la documentation
    
    
    
    import requests
    import csv
    # 1. afficher l'ensemble des métadonnées (?)
    url = "http://gallica.bnf.fr/iiif/" + ark + "/manifest.json"
    r = requests.get(url)
    data = r.json()
    meta = data["metadata"]
    print(meta)

    # 2. générer un fichier CSV
    # préparer une liste des métadonnées sélectionnées
    pour_csv = []
    pour_csv.append("1")
    pour_csv.append(meta[6]["value"])
    pour_csv.append(meta[3]["value"])
    pour_csv.append(str(data["sequences"][0]["canvases"][0]["width"]))
    pour_csv.append(str(data["sequences"][0]["canvases"][0]["height"]))
    
    # écrire dans le fichier CSV
    with open(nom_csv, mode="w") as file:
        writing = csv.writer(file, delimiter=",")
        writing.writerow(colonnes)
        writing.writerow(pour_csv)
    return None

# Testez le code ici
iiif_csv("ark:/12148/btv1b84259980", "pages.csv")
