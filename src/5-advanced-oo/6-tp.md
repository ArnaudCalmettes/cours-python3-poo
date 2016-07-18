## TP : Base de données

Pour ce dernier TP, nous aborderons les méthodes de classe et les propriétés.

Reprenons notre forum, auquel nous souhaiterions ajouter la gestion d'une base de données.

Notre base de données sera une classe avec deux méthodes, `insert` et `select`. Son implémentation est libre, elle doit juste respecter l'interface suivante :

```python
>>> class A: pass
...
>>> class B: pass
...
>>>
>>> db = Database()
>>> obj = A()
>>> obj.value = 42
>>> db.insert(obj)
>>> obj = A()
>>> obj.value = 5
>>> db.insert(obj)
>>> obj = B()
>>> obj.value = 42
>>> obj.name = 'foo'
>>> db.insert(obj)
>>>
>>> db.select(A)
<__main__.A object at 0x7f033697f358>
>>> db.select(A, value=5)
<__main__.A object at 0x7f033697f3c8>
>>> db.select(B, value=42)
<__main__.B object at 0x7f033697f438>
>>> db.select(B, value=42, name='foo')
<__main__.B object at 0x7f033697f438>
>>> db.select(B, value=5)
ValueError: item not found
```

Nous ajouterons ensuite une classe `Model`, qui se chargera de stocker dans la base toutes les instances créées.
`Model` comprendra une méthode de classe `get(**kwargs)` chargée de réaliser une requête `select` sur la base de données et de retourner l'objet correspondant.
Les objets de type `Model` disposeront aussi d'une propriété `id`, retournant l'identifiant unique de l'objet, dont l'implémentation est libre.

On pourra alors faire hériter nos classes `User` et `Post` de `Model`, afin que les utilisateurs et messages soient stockés en base de données.
Dans un second temps, on pourra faire de `Model` une classe abstraite, par exemple en rendant abstraite la méthode `__init__`.

```python
import abc
import datetime

class Database:
    data = []

    def insert(self, obj):
        self.data.append(obj)

    def select(self, cls, **kwargs):
        items = (item for item in self.data
                 if isinstance(item, cls)
                 and all(hasattr(item, k) and getattr(item, k) == v
                         for (k, v) in kwargs.items()))
        try:
            return next(items)
        except StopIteration:
            raise ValueError('item not found')

class Model(abc.ABC):
    db = Database()
    @abc.abstractmethod
    def __init__(self):
        self.db.insert(self)
    @classmethod
    def get(cls, **kwargs):
        return cls.db.select(cls, **kwargs)
    @property
    def id(self):
        return id(self)

class User(Model):
    def __init__(self, name):
        super().__init__()
        self.name = name

class Post(Model):
    def __init__(self, author, message):
        super().__init__()
        self.author = author
        self.message = message
        self.date = datetime.datetime.now()

    def format(self):
        date = self.date.strftime('le %d/%m/%Y à %H:%M:%S')
        return '<div><span>Par {} {}</span><p>{}</p></div>'.format(self.author.name, date, self.message)

if __name__ == '__main__':
    john = User('john')
    peter = User('peter')
    Post(john, 'salut')
    Post(peter, 'coucou')

    print(Post.get(author=User.get(name='peter')).format())
    print(Post.get(author=User.get(id=john.id)).format())
```
