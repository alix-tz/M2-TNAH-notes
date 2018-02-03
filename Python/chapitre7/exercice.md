``` python
lieux = {
    0: {
        "nom": "Col. Lugdunum",
        "moderne": "Lyon",
        "latlong": [45.762095775, 4.822438025],
        "type": "ville",
        "description": "Col. Lugdunum was a Roman military colony from 43 BC and a major center in Gaul. Marcus "
                       "Agrippa was involved in its expansion and two Roman emperors, Claudius and Caracalla, "
                       "were born there."
    },
    1: {
        "nom": "Samarobriva Ambianorum",
        "moderne": "Amiens",
        "type": "ville",
        "description": "An ancient place, cited: BAtlas 11 C3 Samarobriva Ambianorum ",
        "latlong": [49.8936075, 2.297948]
    }
}
@app.route("/place/<int:place_id>")
def lieu(place_id):
  try:
    return render_template("pages/place.html", nom="Gazetteer", lieu=lieux[place_id])
except IndexError:
    return render_template("pages/erreur404.html"), nom="Gazetteer", lieu="Error404"
```

**Ce code peut générer des erreurs.**
1. *Dans quelles conditions ?*  
-> si on demande un index qui n'est pas présent dans le dictionnaire "lieux". (ex. 3).
2. *Récupérer le nom de l'erreur*  
-> IndexError
3. *Ajouter un try-except*  
-> cf code
4. *Quel code HTTP devrait-on ajouter ?*  
-> 404
