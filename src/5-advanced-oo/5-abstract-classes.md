## L'art des classes abstraites

La notion de classes abstraites est utilisée lors de l'héritage pour forcer les classes filles à implémenter certaines méthodes (dites méthodes abstraites) et donc respecter une interface.

Les classes abstraites ne font pas partie du cœur même de Python, mais sont disponibles via un module de la bibliothèque standard, `abc` (*Abstract Base Classes*).
Ce module contient notamment la classe `ABC` et le décorateur `abstractmethod`, pour définir respectivement une classe abstraite et une méthode abstraite de cette classe.

Une classe abstraite doit donc hériter d'`ABC`, et utiliser le décorateur cité pour définir ses méthodes abstraites.

```python
import abc

class MyABC(abc.ABC):
    @abstractmethod
    def foo(self):
        pass
```

Il nous est impossible d'instancier des objets de type `MyABC`, puisqu'une méthode abstraite n'est pas implémentée :

```python
>>> MyABC()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Can't instantiate abstract class MyABC with abstract methods foo
```

Il en est de même pour une classe héritant de `MyABC` sans surcharger la méthode.

```python
>>> class A(MyABC):
...     pass
...
>>> A()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Can't instantiate abstract class A with abstract methods foo
```

Aucun problème par contre avec une autre classe qui surcharge bien la méthode.

```python
>>> class B(MyABC):
...     def foo(self):
...        return 7
...
>>> B()
<__main__.B object at 0x7f33065316a0>
>>> B().foo()
7
```
