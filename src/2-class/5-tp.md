## TP

Pour ce premier TP, nous allons nous intéresser aux classes d'un forum.
Forts de notre type `User` pour représenter un utilisateur, nous souhaitons ajouter une classe `Post`, correspondant à un quelconque message.

Cette classe sera inititalisée avec un auteur (un objet `User`) et un contenu textuel (le corps du message). Une date sera de plus générée lors de la création.

Un `Post` possèdera une méthode `format` pour retourner le message formaté, correspondant au HTML suivant :

```html
<div>
    <span>Par NOM_DE_L_AUTEUR le DATE_AU_FORMAT_JJ_MM_YYYY à HEURE_AU_FORMAT_HH_MM_SS</span>
    <p>
        CORPS_DU_MESSAGE
    </p>
</div>
```

De plus, nous ajouterons une méthode `post` à notre classe `User`, receva t un corps de message en paramètre et retournant un nouvel objet `Post`.

```python
import crypt
import datetime

class User:
    def __init__(self, id, name, password):
        self.id = id
        self.name = name
        self._salt = crypt.mksalt()
        self._password = self._crypt_pwd(password)

    def _crypt_pwd(self, password):
        return crypt.crypt(password, self._salt)

    def check_pwd(self, password):
        return self._password == self._crypt_pwd(password)

    def post(self, message):
        return Post(self, message)

class Post:
    def __init__(self, author, message):
        self.author = author
        self.message = message
        self.date = datetime.datetime.now()

    def format(self):
        date = self.date.strftime('le %d/%m/%Y à %H:%M:%S')
        return '<div><span>Par {} {}</span><p>{}</p></div>'.format(self.author.name, date, self.message)

if __name__ == '__main__':
    user = User(1, 'john', '12345')
    p = user.post('Salut à tous')
    print(p.format())
```
