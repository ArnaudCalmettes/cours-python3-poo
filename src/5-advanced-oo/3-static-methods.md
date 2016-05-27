## Méthodes statiques

Les méthodes statiques sont très proches des méthodes de classe, mais sont plus à considérer comme des fonctions au sein d'une classe.

Contrairement aux méthodes de classe, elles ne recevront pas le paramètre `cls`, et n'auront donc pas accès aux attributs/méthodes de classe/statiques.

Les méthodes statiques sont plutôt dédiées à des comportements annexes en rapport avec la classe, par exemple une méthode ???

Elles se définissent avec le décorateur `staticmethod`.

```python
class A:
    @staticmethod
    def static():
        return 'static'
```

```python
>>> A.static()
'static'
>>> A().static()
'static'
```
