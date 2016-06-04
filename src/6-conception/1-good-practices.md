## Bonnes pratiques

### Responsabilité unique

Le principe de responsabilité unique indique que des problèmes distincts devraient être gérés par des classes distinctes.

Lors d'un héritage, la classe fille varie par rapport à sa mère. La responsabilité unique impose que la classe ne varie que pour une seule raison (une seule responsabilité).

### Substitution de Liskov

La substitution de Liskov redéfinit la notion de sous-typage. Elle exprime qu'une classe doit pouvoir se substituer à ses sous-types sans modifier les propriétés de l'objet.

Ce principe introduit aussi les notions de covariance et de contravariance. Étant donné deux classes `A` et `B` telles que `B` hérite de `A`, et deux classes `C` et `D` telles que `D` hérite de `C` :

* Si une méthode de `A` retourne un objet de type `C`, alors `B` peut surcharger cette méthode pour retourner un objet `D` sans casser les interfaces (covariance) ;
* De même, si une méthode de `A` attend en paramètre un objet de type `D`, `B` peut étendre cette méthode de façon à recevoir un objet `C` sans briser la compatibilité (contravariance).

### Inversion de dépendances

Ce principe énonce que l'interface d'une classe ne doit jamais dépendre des détails d'implémentation.
Au contraire, ces détails doivent s'adapter à l'interface définie.

De même, les classes de haut-niveau ne doivent dépendre que de l'interface, et non des détails d'implémentation.

### L'objet selon Python

Le modèle objet implémenté en Python peut se différencier du modèle classique par sa flexibilité.

Nous avons vu par exemple que le langage offrait peu de possibilités pour l'encapsulation, sans réelle possibilité de visibilités publique, protégée ou privée.

Nous avons aussi parlé du *duck-typing*, concept très présent en Python, qui limite les besoins de sous-typage, et donc d'héritage.

Enfin, nous avons exploré les mixins, ces petites classes qui ne peuvent s'utiliser seules mais qui servent à ajouter des fonctionnalités à une autre classe par héritage.
