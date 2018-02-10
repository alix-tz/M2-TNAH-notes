# Python

## Chapitre 10 : Session utilisation et insertions

### Commandes et fonctions
- `db.session.add(ajout)` et `db.session.commit()` : pour réaliser des insertions dans les bases de données dans l'application.
- `generate_password_hash(mot_de_passe)` et `check_password_hash` : pour gérer la création des mots de passe de manière sécurisée et leur vérification lors de la connexion.
- `@staticmethod` : décorateur qui signale une méthode statique
- `request.method` : pour récupérer la méthode d'envoi d'une requête
- `flask.flash("message", "statut pour classe css")` : plugin qui permet d'afficher des messages sur la page.
- `flask.redirect` : permet de rediriger vers une URL précise. (ex : dans *routes.py* : *if request.method == "POST":*)
- classes `flask_login.LoginManager` et `flask_login.UserMixin`
- `flask_login.current_user` pour obtenir l'utilisateur courant
- `flask_login.login_user(utilisateur)` fonction qui prend en argument l'utilisateur pour valider son authentification
- `flask_login.logout_user` fonction qui permet de déconnecter l'utilisateur
- variable de template `{{ current_user }}`, passée automatiquement au template


### Créer des comptes
La prise en compte de la question de la sécurité est essentielle. On peut utiliser la technique du `hash and salt`.  
Plus de doc : [http://security.blogoverflow.com/2013/09/about-secure-password-hashing/](http://security.blogoverflow.com/2013/09/about-secure-password-hashing/)  

#### Werkzeug
`Werkzeug` est un outil qui permet à Flask de gérer les mots de passes. Il prend deux fonctions :  
- `generate_password_hash`  
- `check_password_hash`

On peut créer un module `constantes.py` dans lequel on stocke les constantes utilisées par l'application. Parmi ces constantes, on configure une information, un "secret", dont Flask et Werkzeug ont besoin pour fonctionner.  
``` python
from warnings import warn

LIEUX_PAR_PAGE = 2
SECRET_KEY = "JE SUIS UN SECRET !"

if SECRET_KEY == "JE SUIS UN SECRET !":
    warn("Le secret par défaut n'a pas été changé, vous devriez le faire", Warning)
```

> `SECRET_KEY` permet de générer le mot de passe de salage.  
> la fonction `warn` permet d'afficher un avertissement si le salage n'a pas fonctionné.

### Créer des comptes utilisateur
Pour créer un compte utilisateur, on a besoin d'une table qui va recevoir les différentes informations. cf. [chapitre 6 : modèles de données](https://github.com/alix-tz/M2-TNAH/blob/master/Python/chapitre6/synthese.md#mod%C3%A8les-de-donn%C3%A9es)

`MySQL` et `SQLAlchemy` fonctionnent par session de changements, de la même manière que `git`. On a donc deux étapes d'enregistrement après la création de modification : la staging area, puis le commit :  
- `db.session.add(les_modif_à_envoyer)`
- `db.session.commit()`

Dans l'exemple suivant, après avoir collecté une série d'informations et vérifié la validité des champs, on "add" une liste qui contient toutes les informations avant de faire un "commit".  

``` python
class User(db.model):
  # ...
  @staticmethod
  def creer(login, email, nom, motdepasse):
      """ Crée un compte utilisateur-rice. Retourne un tuple (booléen, User ou liste).
      Si il y a une erreur, la fonction renvoie False suivi d'une liste d'erreur
      Sinon, elle renvoie True suivi de la donnée enregistrée
      :param login: Login de l'utilisateur-rice
      :param email: Email de l'utilisateur-rice
      :param nom: Nom de l'utilisateur-rice
      :param motdepasse: Mot de passe de l'utilisateur-rice (Minimum 6 caractères)
      """
      erreurs = [] # si on a des champs vide, on crée une liste d'erreur
      if not login:
          erreurs.append("Le login fourni est vide")
      if not email:
          erreurs.append("L'email fourni est vide")
      if not nom:
          erreurs.append("Le nom fourni est vide")
      if not motdepasse or len(motdepasse) < 6:
          erreurs.append("Le mot de passe fourni est vide ou trop court")
      # On vérifie que personne n'a utilisé cet email ou ce login
      uniques = User.query.filter(
          db.or_(User.user_email == email, User.user_login == login)
      ).count()
      if uniques > 0:
          erreurs.append("L'email ou le login sont déjà inscrits dans notre base de données")
      # Si on a au moins une erreur (donc un élément dans la liste erreur)
      if len(erreurs) > 0:
          return False, erreurs # c'est un tuple ; on peut donc écrire des tuples sans parenthèses

        # On crée un utilisateur (ça correspond donc aux champs de la table User)
        utilisateur = User(
          user_nom=nom,
          user_login=login,
          user_email=email,
          user_password=generate_password_hash(motdepasse)
      )

      try:
        # On l'ajoute au transport vers la base de données
        # comme sur Git, on peut faire plusieurs add avant de faire le commit
          db.session.add(utilisateur)
          # On envoie le paquet
          db.session.commit()

          # On renvoie l'utilisateur
          return True, utilisateur
      except Exception as erreur:
          return False, [str(erreur)]
```

### Gérer la connexion et les sessions : `Flask-login`
[**Documentation Flask-Login**](https://flask-login.readthedocs.io/en/latest/)  
[**Documentation LoginManager**](https://flask-login.readthedocs.io/en/latest/#flask_login.LoginManager)  
[**Documentation UserMixin**](https://flask-login.readthedocs.io/en/latest/#flask_login.UserMixin)  

`flask-login` est un plugin de Flask qu'on installe avec `pip` :  
`pip install flask-login`  

Pour configurer `flask-login`, on crée un objet de class LoginManager qui contient le code pour gérer l'interaction entre Flask-login et l'application. Dans `app.py` :
``` python
from flask_login import LoginManager
app = Flask(...)
# ...
login = LoginManager(app)
```

#### `flask_login.UserMixin`
Il faut par ailleurs que la table qui contient les informations utilisateur (User), qui est un objet SQLAlchemy, soit configurée pour être comprise par Flask Login. Il existe 3 propriétés et 1 fonction utiles pour gérer la connexion :
- `is_authenticated` (retourne True que l'utilisateur est connecté)  
- `is_active` (retourne True si l'utilisateur est actif)
- `is_anonymous` (retourne False pour les utilisateurs non anonymes)
- `get_id(Identifier)` (retourne les informations utilisateurs pour une Id donnée)

Avec la classe `flask_login.UserMixin` on peut configurer ces 4 éléments de manière simple par défaut :
``` python
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin

from .. app import db

class User(UserMixin, db.Model):
    # ...
```

> UserMixin est ajouté à db.Model pour informer Python que User est à la fois un db.Model et un UserMixin.  
> `get_id()` ne fonctionne pas car il a besoin d'une propriété `.id`

On ajoute donc :  
``` python
class User(UserMixin, db.Model):
    # ...
    def get_id(self):
        """ Retourne l'id de l'objet actuellement utilisé

        :returns: ID de l'utilisateur
        :rtype: int
        """
        return self.user_id
```

> `self` permet de viser la valeur de l'utilisateur courant.

Et on complète par une fonction qui permet de récupérer un utilisateur en fonction de son identifiant (dans *utilisateur.py*) :  
``` python
from app import login

# ...
@login.user_loader
def trouver_utilisateur_via_id(id):
    return User.query.get(int(id))
```


### Création du formulaire d'inscription

``` python
from flask import flash, redirect, request

@app.route("/register", methods=["GET", "POST"]) # ici ça veut dire qu'on signifie à Flask que la requête ne fonctionne que pour GET et que pour POST. Quand on définit une route, par défaut methods=GET.
def inscription():
    """ Route gérant les inscriptions
    """
    # Si on est en POST, cela veut dire que le formulaire a été envoyé
    if request.method == "POST":  # request.method permet de récupérer la méthode utilisée
        statut, donnees = User.creer(
            login=request.form.get("login", None), # avec GET on avait request.args (pour récupérer les informations qui sont dans la barre url. Se comporte comme un dictionnaire ;
            email=request.form.get("email", None), # avec POST on a request.form qui permet de vérifier qu'on a bien envoyé un formulaire et de récupérer ces informations. Se comporte comme un dictionnaire.
            nom=request.form.get("nom", None),
            motdepasse=request.form.get("motdepasse", None)
        )
        if statut is True:
            flash("Enregistrement effectué. Identifiez-vous maintenant", "success")
            return redirect("/")
        else:
            flash("Les erreurs suivantes ont été rencontrées : " + ",".join(donnees), "error")
            return render_template("pages/inscription.html")
    else:
        return render_template("pages/inscription.html")
    # en revanche GET permet d'accéder à la page sur laquelle on va pouvoir mettre les informations pour se connecter.
```
Commentaire sur le code :
> spécifier la méthod permet de gérer la manière dont la page réagit : soit elle affiche la page de création du compte (GET), soit elle envoie les informations pour créer le compte (POST).  
> `request.method` permet de vérifié la méthode utilisée  
> `flask.flash` permet d'afficher des messages pour l'utilisateur en cas d'erreur.  
> `flask.redirect` permet de rediriger vers une URL précise.  
> la route `inscription` ne sert qu'à gérer les différentes fonctions qui sont dans `modeles/utilisateurs.py`.  

Pour voir comment `Flash` fonctionne regarder `exemple16/`.

### Création du formulaire de connexion
Dans le template, création d'un nouveau formulaire :
``` html
{% extends "conteneur.html" %}

{% block titre %}| Connexion{%endblock%}

{% block corps %}

<h1>Inscription</h1>
<form class="form" method="POST" action="{{url_for("connexion")}}">
  <div class="form-group row">
    <label for="register-login" class="col-sm-2 col-form-label">Login</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="register-login" name="login" placeholder="Nom d'utilisateur pour se connecter">
    </div>
  </div>
  <div class="form-group row">
    <label for="register-password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="register-password" placeholder="Mot de passe" name="motdepasse">
    </div>
  </div>
  <div>
    <button type="submit" class="btn btn-primary">Connexion</button>
    <a href="{{url_for("inscription")}}" class="btn btn-secondary">Inscription</a>
  </div>
</form>
{% endblock %}
```

Dans *routes.py*, création d'une nouvelle route vers le template du formulaire :
``` python
from flask_login import login_user, current_user
from .app import login


@app.route("/connexion", methods=["POST", "GET"])
def connexion():
    """ Route gérant les connexions
    """
    if current_user.is_authenticated is True:
        flash("Vous êtes déjà connecté-e", "info")
        return redirect("/")
    # Si on est en POST, cela veut dire que le formulaire a été envoyé
    if request.method == "POST":
        utilisateur = User.identification(
            login=request.form.get("login", None),
            motdepasse=request.form.get("motdepasse", None)
        )
        if utilisateur:
            flash("Connexion effectuée", "success")
            login_user(utilisateur)
            return redirect("/")
        else:
            flash("Les identifiants n'ont pas été reconnus", "error")

    return render_template("pages/connexion.html")

login.login_view = 'connexion'
```

Commentaire sur ce code :  
> `flask_login.current_user` permet d'obtenir l'utilisateur courant  
> `flask_login.login_user` prend en argument l'utilisateur identifié  
> `login.login_view = 'connexion'` fait référence à la fonction "connexion" définit dans la route "/connexion". Dans routes.py


### Vérifier la validité de l'identification de l'utilisateur
Dans le cours on a utilisé la fonction suivante :
``` python
def identification(login, motdepasse):
    """ Identifie un utilisateur. Si cela fonctionne, renvoie les données de l'utilisateurs.

    :param login: Login de l'utilisateur
    :param motdepasse: Mot de passe envoyé par l'utilisateur
    :returns: Si réussite, données de l'utilisateur. Sinon None
    :rtype: User or None
    """
    utilisateur = User.query.filter(User.user_login == login).first()
    if utilisateur and check_password_hash(utilisateur.user_password, motdepasse):
        return utilisateur
    return None
```

Elle est enregistrée "sous la responsabilité de la classe `User`".

### Déconnexion
On crée une route de déconnexion qui utilise la fonction `flask_login.logout_user` :  
``` python
from flask_login import logout_user, current_user

@app.route("/deconnexion") # la déconnexion a forcément lieu en GET
def deconnexion():
    if current_user.is_authenticated is True:
        logout_user()
    flash("Vous êtes déconnecté-e", "info")
    return redirect("/")
```

### Afficher l'utilisateur dans les templates : `{{ current_user }}`
La variable {{ current_user}} permet d'afficher l'utilisateur dans les templates pour personnaliser la page. Cette variable est automatiquement passée au template, on n'a donc pas besoin de l'inclure dans les valeurs retournées dans *render_template()*.

---
### Méthodes statiques
Une méthode statique se déclare avec une syntaxe similaire aux routes :  
`@staticmethod`  

Cette commande est placée juste avant la définition de la fonction.
``` Python
class User(db.Model):
    user_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    user_nom = db.Column(db.Text, nullable=False)
    user_login = db.Column(db.String(45), nullable=False, unique=True)
    user_email = db.Column(db.Text, nullable=False)
    user_password = db.Column(db.String(64), nullable=False)

@staticmethod
  def identification(login, motdepasse):
      """ Identifie un utilisateur. Si cela fonctionne, renvoie les données de l'utilisateurs.
      :param login: Login de l'utilisateur
      :param motdepasse: Mot de passe envoyé par l'utilisateur
      :returns: Si réussite, données de l'utilisateur. Sinon None
      :rtype: User or None
      """
      utilisateur = User.query.filter(User.user_login == login).first()
      if utilisateur and check_password_hash(utilisateur.user_password, motdepasse):
          return utilisateur
      return None
```
On pourra ainsi appeler la fonction de la manière suivante :   
``` python
utilisateur = User.identification(login, motdepasse)
```

Documentation sur les méthodes statiques :  
- [http://www.bogotobogo.com/python/python_differences_between_static_method_and_class_method_instance_method.php](http://www.bogotobogo.com/python/python_differences_between_static_method_and_class_method_instance_method.php)
- [https://stackoverflow.com/questions/735975/static-methods-in-python](https://stackoverflow.com/questions/735975/static-methods-in-python)

---
cf. [video](https://www.youtube-nocookie.com/embed/8ZtInClXe1Q).  

> Le protocole qui consiste à s'identifier via facebook, google, etc, c'est "oAuth", 1 ou 2.  
> Type d'attaque :  
> - Man in the middle. (se placer en intermédiaire dans une connexion prétendue sécurisée et récupérer les données).  
> 	Deux moyens de se protéger : HTTPS, et encrypter les Cookies et les informations de session.  
> - Bruteforce.  
> Faille xss -> utiliser la barre url pour renvoyer un message. C'est vraiment une faille de sécurité puisque n'importe qui peut en profiter pour modifier le contenu du site. C'est le hack le plus simple à faire.  
