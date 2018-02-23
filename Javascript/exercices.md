Exercice 1

Ecrivez une condition pour savoir si le contenu de 
cette variable est supérieur à 10. Si tel est le cas, affichez une fenêtre alert() pour en informer l'utilisateur.

var monNombre = 15;

if (monNombre > 10) {
alert("le contenu de monNombre est supérieur à 10");
}

---


Exercice 2

Changez le code pour qu'il vérifie que monNombre est plus grand que 10, plus petit que 10 ou égal à 10 et prévient en alert().

var monNombre = 15;

if (monNombre > 10) {
    alert("plus grand que 10")
} else if (monNombre < 10){
    alert("plus petit que 10")
} else {
    alert("égal à 10")
}

---

Exercice 3

Compléter le code suivant afin de réaliser un code html comprenant des <li> pour chacun des vers, un article encapsulant le texte et un header et footer pour compléter le tout avec les métadonnées.

var texte = {
    "meta":"line",
    "author":"aeschylus",
    "credit":"OpenGreekAndLatin",
    "urn":"urn:cts:greekLit:tlg0085.tlg007.opp-grc3-simple",
    "text": [
        "Πρῶτον μὲν εὐχῇ τῇδε πρεσβεύω θεῶν",
        "τὴν πρωτόμαντιν Γαῖαν: ἐκ δὲ τῆς Θέμιν,",
        "ἣ δὴ τὸ μητρὸς δευτέρα τόδ ̓ ἕζετο",
        "μαντεῖον, ὡς λόγος τις: ἐν δὲ τῷ τρίτῳ",
    ]
};


var html = "<article>\n<header>";
html += texte["author"] + " in " + texte["meta"];
html += "</header>\n<section>\n<ul>\n";

for (var i = 0; i < texte["text"].length ; ++i){
html += "<li>" + texte.text[i] + "</li>\n";
};

html += "</ul>\n</section>\n<footer>\n" + texte["urn"] + "<br/>\n" + texte["credit"] + "</footer>\n</article>";
console.log(html);


---

Exercice 4

Ecrire une fonction dans fonction js se nommant “trouverlemot” prenant un paramètre mot et un dictionnaire de textes (cf. data.js).

    Utiliser console.log pour afficher l’identifiant que la phrase possède.
    Retourner une liste des valeurs

Vous aurez besoin :

    De boucles
    De trouver sur internet la documentation pour trouver une chaine dans une autre chaîne
    Trouver comment ajouter un élément a une liste

Essayer avec les mots : Catiline, judge, Sulla

