## Bonnes pratiques

Intéressons-nous premièrement aux bonnes pratiques, c'est à dire aux règles à appliquer pour produire du code conforme au modèle objet.

### Principes *SOLID*^[<>]

*SOLID* est un acronyme regroupant 5 principes qui régissent la programmation orientée objet.

* *__S__ingle Responsibility* (Respinsabilité unique)
* *__O__pen/Closed* (Ouvert/fermé)
* *__L__iskov Substitution* (Substitution de Liskov)
* *__I__nterface Segregation* (Ségrégation des interfaces)
* *__D__ependency Inversion* (Inversion de dépendances)

#### Responsabilités unique^[<>]

Le principe de responsabilité unique énonce que des problèmes distincts devraient être gérés par des classes distinctes.

Lors d'un héritage (`User -> Guest`), la classe fille varie par rapport à sa mère (suppression de la vérification du mot de passe).
La responsabilité unique impose que la classe ne varie que pour une seule raison (une seule responsabilité) : nous n'aurons par exemple pas directement de classe `GuestPicture` héritant de `User` pour ajouter la suppression du mot de passe et la gestion d'une image utilisateur.

#### Ouvert/fermé^[<>]

Les classes doivent être ouvertes à l'extension mais fermées à la modification.

C'est à dire que l'architecture des classes doit permettre simplement d'en hériter pour étendre leur comportement.
Ainsi, on préférera les conditions de type `isinstance(obj, Cls)` que `type(obj) == Cls` qui permettent à une classe fille de jouer le même rôle.

En revanche, une classe déjà existante ne devrait pas être modifiée en place.
Toute modification doit passer par une extension de la classe.
De même, les fonctions manipulant les objets d'une telle classe n'ont pas à être modifiées pour permettre la création d'une nouvelle classe fille.

#### Substitution de Liskov^[<>]

La substitution de Liskov précise la notion de sous-typage. Elle définit qu'un sous-type devrait toujours pouvoir se substituer à son type parent sans en altérer les propriétés.

Un objet de type `B` dérivant de `A` doit ainsi toujours respecter les interfaces de `A` (mêmes méthodes traitant les mêmes types de paramètres), tout en pouvant les étendre (traiter des types plus généraux, retourner des types plus spécifiques).

#### Ségrégation des interfaces^[<>]

Séparer en plusieurs interfaces distinctes plutôt qu'une grosse interface trop générale.

#### Inversion de dépendances^[<>]

Ce principe énonce que l'interface d'une classe ne doit jamais dépendre des détails d'implémentation.
Au contraire, ces détails doivent s'adapter à l'interface définie.

De même, les classes de haut-niveau ne doivent dépendre que de l'interface, et non des détails d'implémentation.

### Loi de Demeter^[<>]

Cette loi, appelée aussi principe de connaissance minimale, stipule comment une méthode doit se comporter avec les paramètres qu'elle reçoit.

### L'objet selon Python

Le modèle objet implémenté en Python peut se différencier du modèle classique par sa flexibilité.

Nous avons vu par exemple que le langage offrait peu de possibilités pour l'encapsulation, sans réelle possibilité de visibilités publique, protégée ou privée.

Nous avons aussi parlé du *duck-typing*, concept très présent en Python, qui limite les besoins de sous-typage, et donc d'héritage.

Enfin, nous avons exploré les mixins, ces petites classes qui ne peuvent s'utiliser seules mais qui servent à ajouter des fonctionnalités à une autre classe par héritage.

Pour le reste, je vous renvoie aux [bonnes pratiques Python](), qui couvrent aussi la programmation orientée objet.
