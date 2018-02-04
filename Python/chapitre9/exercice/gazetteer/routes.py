from flask import render_template, request


from .app import app
from .modeles.donnees import Place


LIEUX_PAR_PAGES = 2


@app.route("/")
def accueil():
    # On a bien sûr aussi modifié le template pour refléter le changement
    lieux = Place.query.order_by(Place.place_id.desc()).limit(5).all()
    return render_template("pages/accueil.html", nom="Gazetteer", lieux=lieux)


@app.route("/place/<int:place_id>")
def lieu(place_id):
    # On a bien sûr aussi modifié le template pour refléter le changement
    unique_lieu = Place.query.get(place_id)
    return render_template("pages/place.html", nom="Gazetteer", lieu=unique_lieu)


@app.route("/recherche")
def recherche():
    # On préfèrera l'utilisation de .get() ici
    #   qui nous permet d'éviter un if long (if "clef" in dictionnaire and dictonnaire["clef"])
    motclef = request.args.get("keyword", None)
    page = request.args.get("page", 1)

    if isinstance(page, str) and page.isdigit():
        page = int(page)
    else:
        page = 1

    # On crée une liste vide de résultat (qui restera vide par défaut
    #   si on n'a pas de mot clé)
    resultats = []

    # On fait de même pour le titre de la page
    titre = "Recherche"
    if motclef:
        resultats = Place.query.filter(
            Place.place_nom.like("%{}%".format(motclef))
        ).paginate(page=page, per_page=LIEUX_PAR_PAGES)
        titre = "Résultat pour la recherche `" + motclef + "`"

    return render_template(
        "pages/recherche.html",
        resultats=resultats,
        titre=titre,
        keyword=motclef
    )
