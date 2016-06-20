## Surcharge de méthodes

Nous savons hériter d'une classe pour y insérer de nouvelles méthodes, mais nous ne savons pas étendre les méthodes déjà présentes dans la classe mère.

Nous voudrions que la classe `Guest` ne possède plus aucun mot de passe. Celle-ci devra modifier la méthode `check_pwd` pour accepter tout mot de passe, et simplifier la méthode `__init__`.

On ne peut pas à proprement parler étendre le contenu d'une méthode, mais on peut la redéfinir :

```python
class Guest(User):
    def __init__(self, id, name):
        self.id = id
        self.name = name
        self._salt = ''
        self._password = ''

    def check_pwd(self, password):
        return True
```

Cela fonctionne comme souhaité, mais vient avec un petit problème, le code de la méthode `__init__` est répété.
En l'occurrence il ne s'agit que de 2 lignes de code, mais lorsque nous voudrons apporter des modifications à la méthode de la classe `User`, il faudra les répercuter sur `Guest`, ce qui donne vite quelque chose de difficile à maintenir.

Heureusement, Python nous offre un moyen de remédier à ce mécanisme, et c'est super !
Oui, `super`, littéralement, une fonction un peu spéciale en Python, qui nous permet d'utiliser la classe parente (*superclass*).

`super` est une fonction qui prend initialement en paramètre une classe et une instance de cette classe. Elle retourne un objet *proxy* qui s'utilise comme une instance de la classe parente.

```python
>>> guest = Guest(3, 'Guest')
>>> guest.check_pwd('password')
True
>>> super(Guest, guest).check_pwd('password')
False
```

Au sein de la classe en question, les arguments de `super` peuvent être omis, ce qui nous permet de simplifier notre méthode `__init__` et d'éviter les répétitions.

```python
class Guest(User):
    def __init__(self, id, name):
        super().__init__(id, name, '')

    def check_pwd(self, password):
        return True
```
