## Doux opérateurs

Les opérateurs sont un autre type de méthodes spéciales que nous découvrirons dans cette section.

En effet, les opérateurs ne sont rien d'autres en Python que des fonctions, qui s'appliquent sur leurs opérandes.
On peut s'en rendre compte à l'aide du module `operator`, qui répertorie les fonctions associées à chaque opérateur.

```python
>>> import operator
>>> operator.add(5, 6)
11
>>> operator.mul(2, 3)
6
```

Ainsi, chacun des opérateurs correspondra à une méthode de l'opérande de gauche, qui recevra en paramètre l'opérande de droite.

### Opérateurs arithmétiques

L'addition, par exemple, est définie par la méthode `__add__`.

```python
>>> class A:
...     def __add__(self, other):
...         return other # on considère self comme 0
...
>>> A() + 5
5
```

Assez simple, n'est-il pas ? Mais nous n'avons pas tout à fait terminé.
Si la méthode est appelée sur l'oéprande de gauche, que se passe-t-il quand notre objet se trouve à droite ?

```python
>>> 5 + A()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'int' and 'A'
```

Nous ne supportons pas cette opération. En effet, l'expression fait appel à la méthode `int.__add__` qui ne connaît pas les objets de type `A`.
Heureusement, ce cas a été prévu et il existe une fonction inverse, `__radd__`, appelée si la première opération n'était pas supportée.

```python
>>> class A:
...     def __add__(self, other):
...         return other
...     def __radd__(self, other):
...         return other
...
>>> A() + 5
5
>>> 5 + A()
5
```

Il faut bien noter que `A.__radd__` ne sera appelée que si `int.__add__` a échoué.

Les autres opérateurs arithmétques binaires auront un comportement similaire, voici une liste des méthodes à implémenter pour chacun d'eux :

* **Addition**/**Concaténation** (`a + b`) — `__add__`, `__radd__`
* **Soustraction**/**Différence** (`a - b`) — `__sub__`, `__rsub__`
* **Multiplication** (`a * b`) — `__mul__`, `__rmul__`
* **Division** (`a / b`) — `__truediv__`, `__rtruediv__`
* **Division entière** (`a // b`) — `__floordiv__`, `__rfloordiv__`
* **Modulo**/**Formattage** (`a % b`) — `__mod__`, `__rmod__`
* **Exponentiation** (`a ** b`) — `__pow__`, `__rpow__`

On remarque aussi que chacun de ces opérateurs arithmétiques possède une version simplifiée pour l'assignation (`a += b`) qui correspond à la méthode `__iadd__`.
Par défaut, les méthodes `__add__`/`__radd__` sont appelées, mais définir `__iadd__` permet d'avoir un comportement différent dans le cas d'un opérateur d'assignation, par exemple sur les listes :

```python
>>> l = [1, 2, 3]
>>> l2 = l
>>> l2 = l2 + [4]
>>> l2
[1, 2, 3, 4]
>>> l
[1, 2, 3]
>>> l2 = l
>>> l2 += [4]
>>> l2
[1, 2, 3, 4]
>>> l
[1, 2, 3, 4]
```

### Opérateurs arithmétiques unaires

Voici pour les opérateurs binaires, voyons maintenant les opérateurs unaires, qui ne prennent donc pas d'autre paramètre que `self`.

* **Opposé** (`-a`) — `__neg__`
* **Valeur abosule** (`abs(a)`) — `__abs__`

### Opérateurs de comparaison

De la même manière que pour les opérateurs arithmétiques, nous avons une méthode spéciale par opérateur de comparaison.
Ces opérateurs s'appliqueront sur l'opérande gauche en recevant le droit en paramètre. Ils devront retourner un booléen.

Contrairement aux opérateurs arithmétiques, il n'est pas nécessaire d'avoir deux versions pour chaque opérateur puisque Python saura directement quelle opération inverse tester si la première a échoué (`a == b` est équivalent à `b == a`, `a < b` à `b > a`, etc.).

* **Égalité** (`a == b`) — `__eq__`
* **Différence** (`a != b`) — `__neq__`
* **Stricte infériorité** (`a < b`) — `__lt__`
* **Infériorité** (`a <= b`) — `__le__`
* **Stricte supériorité** (`a > b`) — `__gt__`
* **Supériorité** (`a >= b`) — `__ge__`

On notera aussi que beaucoup de ces opérateurs peuvent s'inférer les uns les autres. Par exemple, il suffit de savoir calculer `a == b` et `a < b` pour définir toutes les autres opérations.
Ainsi, Python dispose d'un décorateur, `total_ordering` du module `functools`,  pour automatiquement générer les opérations manquantes.

```python
>>> from functools import total_ordering
>>> @total_ordering
... class Inferior:
...     def __eq__(self, other):
...         return False
...     def __lt__(self, other):
...         return True
...
>>> i = Inferior()
>>> i == 5
False
>>> i > 5
False
>>> i < 5
True
>>> i <= 5
True
>>> i != 5
True
```

### Autres opérateurs

Nous avons ici étudié les principaux opérateurs du langage. Ces listes ne sont pas exhaustives et présentent juste la méthodologie à suivre.

Pour une liste complète, je vous invite à consulter la documentation du module `operator` : <https://docs.python.org/3/library/operator.html>.
