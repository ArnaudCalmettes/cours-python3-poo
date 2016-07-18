## Argumentons pour construire

Nous avons vu qu'instancier une classe était semblable à un appel de fonction.
Dans ce cas, comment passer des arguments à une classe, comme on le ferait pour une fonction ?

Il faut pour cela comprendre les bases du mécanisme d'instanciation de Python.
Quand on appelle une classe, un nouvel objet de ce type est construit en mémoire, puis initialisé. Cette initialisation permet d'assigner des valeurs à ses attributs.

L'objet est initialisé à l'aide d'une méthode spéciale de sa classe, la méthode `__init__`. Cette dernière recevra les arguments passés lors de l'instanciation.

```python
class User:
    def __init__(self, id, name, password):
        self.id = id
        self.name = name
        self.password = password

    def check_pwd(self, password):
        return self.password == password
```

Nous retrouvons dans cette méthode le paramètre `self`, qui est donc utilisé pour modifier les attributs de l'objet.

```python
>>> john = User(1, 'john', '12345')
>>> john.check_pwd('toto')
False
>>> john.check_pwd('12345')
True
```
