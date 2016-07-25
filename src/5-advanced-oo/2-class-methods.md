## La méthode pour avoir la classe

Comme pour les attributs, des méthodes peuvent être définies au niveau de la classe. C'est par exemple le cas de la méthode `mro`.

```python
int.mro()
```

Les méthodes de classe constituent des opérations relatives à la classe mais à aucune instance.
Elles recevront la classe courante en premier paramètre (nommé `cls`, correspondant au `self` des méthodes d'instance), et auront donc accès aux autres attributs et méthodes de classe.

Reprenons notre classe `User`, à laquelle nous voudrions ajouter le stockage de tous les utilisateurs, et la génération automatique de l'`id`.
Il nous suffirait d'une même méthode de classe pour stocker l'utilisateur dans un attribut de classe `users`, et qui lui attribuerait un `id` en fonction du nombre d'utilisateurs déjà enregistrés.

```python
>>> root = Admin('root', 'toor')
>>> root
<User: 1, root>
>>> User('john', '12345')
<User: 2, john>
>>> guest = Guest('guest')
<User: 3, guest>
```

Les méthodes de classe se définissent comme les méthodes habituelles, à la différence près qu'elles sont précédées du décorateur `classmethod`.

```python
import crypt

class User:
    users = []

    def __init__(self, name, password):
        self.name = name
        self._salt = crypt.mksalt()
        self._password = self._crypt_pwd(password)
        self.register(self)

    @classmethod
    def register(cls, user):
        cls.users.append(user)
        user.id = len(cls.users)

    def _crypt_pwd(self, password):
        return crypt.crypt(password, self._salt)

    def check_pwd(self, password):
        return self._password == self._crypt_pwd(password)

    def __repr__(self):
        return '<User: {}, {}>'.format(self.id, self.name)

class Guest(User):
    def __init__(self, name):
        super().__init__(name, '')

    def check_pwd(self, password):
        return True

class Admin(User):
    def manage(self):
        print('I am an über administrator!')
```

Vous pouvez constater le résultat en réessayant le code donné plus haut.
