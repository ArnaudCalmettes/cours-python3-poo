# Objet et caractéristiques

Tout d'abord, qu'est-ce qu'un objet ?
En introduction, nous avons dit qu'un objet avait des propriétés
et pouvait être manipulé par des opérations, c'est bien beau tout ça mais qu'est-ce que ça peut
bien vouloir dire concrétement ?

En introduction, nous avons décrit un objet comme une valeur possédant des propriétés et manipulée par des opérations.

Concrètement, un objet est constitué de 3 caractéristiques :

* Un type, qui identifie le rôle de l'objet (`int`, `str` et `list` sont des exemples de types d'objets) ;
* Des attributs, qui sont les propriétés de l'objet ;
* Des méthodes, les opérations qui s'appliquent sur l'objet.

Pour vous éclairer, prenons le code suivant :

```python
>>> number = 5 # On instancie une variable `number` de type `int`
>>> number.numerator # `numerator` est un attribut de `number`
5
>>> values = [] # Variable `values` de type `list`
>>> values.append(number) # `append` est une méthode de `values`
>>> values
[5]
```

Toute valeur en Python est donc un objet.
