# Extension et héritage

Il n'est pas dans ce chapitre question de régler la succession de votre grand-tante par alliance, mais de nous intéresser à l'extension de classes.

Imaginons que nous voulions définir une classe `Admin`, pour gérer des administrateurs, qui réutiliserait le même code que la classe `User`.
Tout ce que nous savons faire actuellement c'est copier/coller le code de la classe `User` en changeant son nom pour `Admin`.

Nous allons maintenant voir comment faire ça de manière plus élégante, grâce à l'héritage. Nous étudierons de plus les relations entre classes ansi créées.

Nous utiliserons donc la classe `User` suivante pour la suite de ce chapitre.

```python
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
```
