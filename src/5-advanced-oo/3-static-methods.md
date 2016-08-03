## Le statique c'est fantastique

Les méthodes statiques sont très proches des méthodes de classe, mais sont plus à considérer comme des fonctions au sein d'une classe.

Contrairement aux méthodes de classe, elles ne recevront pas le paramètre `cls`, et n'auront donc pas accès aux attributs de classe, méthodes de classe ou méthodes statiques.

Les méthodes statiques sont plutôt dédiées à des comportements annexes en rapport avec la classe, par exemple on pourrait remplacer notre attribut `id` par un *uuid* aléatoire, dont la génération ne dépendrait de rien d'autre dans la classe.

Elles se définissent avec le décorateur `staticmethod`.

```python
import uuid

class User:
    def __init__(self, name, password):
        self.id = self._gen_uuid()
        self.name = name
        self._salt = crypt.mksalt()
        self._password = self._crypt_pwd(password)

    @staticmethod
    def _gen_uuid():
        return str(uuid.uuid4())

    def _crypt_pwd(self, password):
        return crypt.crypt(password, self._salt)

    def check_pwd(self, password):
        return self._password == self._crypt_pwd(password)
```

```python
>>> john = User('john', '12345')
>>> john.id
'69ef1327-3d96-42a9-94e6-622619fbf666'
```
