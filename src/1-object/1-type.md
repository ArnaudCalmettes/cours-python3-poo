## Il a une drôle de tête ce type-là

Ainsi, tout objet est associé à un type. Un type définit la sémantique d'un objet.
On sait par exemple que les objets de type `int` sont des nombres entiers, que l'on peut les additionner, les soustraire, etc.

Pour la suite de ce cours, nous utiliserons un type `User` représentant un utilisateur sur un quelconque logiciel.
Nous pouvons créer ce nouveau type à l'aide du code suivant :

```python
class User:
    pass
```

Nous reviendrons sur ce code par la suite, retenez simplement que nous avons maintenant à notre disposition un type `User`.

Pour créer un objet de type `User`, il nous suffit de procéder ainsi :

```python
john = User()
```

On dit alors que `john` est une instance de `User`.
