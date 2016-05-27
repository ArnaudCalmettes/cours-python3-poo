## Méthodes de classes

Comme pour les attributs, des méthodes peuvent être définies au niveau de la classe. C'est par exemple le cas de la méthode `mro`.

```python
int.mro()
```

Les méthodes de classe constituent des opérations relatives à la classe mais à aucune instance.
Elles recevront la classe courante en premier paramètre (nommé `cls`, correspondant au `self` des méthodes d'instance), et auront donc accès aux autres attributs et méthodes de classe.

Étant donné une classe

```python
class Point:
    def __init__(x, y):
        self.x, self.y = x, y
```

Nous pourrions vouloir deux méthodes de classe `xaxis` et `yaxis` pour créer respectivement des points sur l'axe des abscisses ou des ordonnées, de façon à avoir :

```python
>>> a = Point.xaxis(5)
>>> a.x
5
>>> a.y
0
>>> b = Point.yaxis(6)
>>> b.x
0
>>> b.y
6
```

Les méthodes de classe se définissent comme les méthodes habituelles, à la différence près qu'elles sont précédées du décorateur `classmethod`.

```python
class Point:
    def __init__(x, y):
        self.x, self.y = x, y
    @classmethod
    def xaxis(cls, x):
        return cls(x, 0)
    @classmethod
    def yaxis(cls, y):
        return cls(0, y)
```
