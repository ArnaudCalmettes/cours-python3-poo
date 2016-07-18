## Les attributs entrent en classe

Nous avons déjà rencontré un attribut de classe, quand nous nous intéressions aux parents d'une classe.
Souvenez-vous de `__bases__`, nous ne l'utilisions pas sur des instances mais sur notre classe directement.

En Python, les classes sont des objets comme les autres, et peuvent donc posséder leurs propres attributs.

```python
>>> class User:
...     pass
...
>>> User.type = 'simple_user'
>>> User.type
'simple_user'
```

Les attributs de classe peuvent aussi se définir dans le corps de la classe, de la même manière que les méthodes.

```python
class User:
    type = 'simple_user'
```

On notera à l'inverse qu'il est aussi possible de définir une méthode de la classe depuis l'extérieur :

```
>>> def User_repr(self):
...     return '<User>'
...
>>> User.__repr__ = User_repr
>>> User()
<User>
```

L'avantage des attributs de classe, c'est qu'ils sont aussi disponibles pour les instances de cette classe.
Ils sont partagés par toutes les instances.

```python
>>> john = User()
>>> john.type
'simple_user'
>>> User.type = 'admin'
>>> john.type
'admin'
```

C'est le fonctionnement du *MRO* de Python, il cherche d'abord si l'attribut existe dans l'objet, puis si ce n'est pas le cas, le cherche dans les classes parentes.

Attention donc, quand l'attribut est redéfini dans l'objet, il sera trouvé en premier, et n'affectera pas la classe.

```python
>>> john = User()
>>> john.type
'admin'
>>> john.type = 'superadmin'
>>> john.type
'superadmin'
>>> User.type
'admin'
>>> joe = User()
>>> joe.type
'admin'
```

Attention aussi, quand l'attribut de classe est mutable, il peut être modifié par n'importe quelle instance de la classe.

```python
>>> class User:
...     users = []
...
>>> john, joe = User(), User()
>>> john.users.append(john)
>>> joe.users.append(joe)
>>> john.users
[<__main__.User object at 0x7f3b7acf8b70>, <__main__.User object at 0x7f3b7acf8ba8>]
```

L'attribut de classe est aussi conservé lors de l'héritage, et partagé avec les classes filles (sauf lorsque les classes filles redéfinissent l'attribut, de la même manière que pour les instances).

```python
>>> class Guest(User):
...     pass
...
>>> Guest.users
[<__main__.User object at 0x7f3b7acf8b70>, <__main__.User object at 0x7f3b7acf8ba8>]
>>> class Admin(User):
...     users = []
...
>>> Admin.users
[]
```
