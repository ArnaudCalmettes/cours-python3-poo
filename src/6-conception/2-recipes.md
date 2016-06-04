## Recettes

On trouve en programmation orientée objet des patrons de conception (*design patterns*) qui répondent à différents besoins dans l'architecture des programmes.
Ceux-ci sont conçus pour des langages assez pauvres et/ou rigides, et se révèlent souvent peu utiles en Python, car déjà couverts par le langage, ou inadaptés à ses abstractions.

Les recettes sont plutôt un recueil de petites classes/fonctions qui reprennent les grandes idées de ces patrons de conception pour les adapter au Python.

### Visiteur

Le visiteur est un patron très utilisé dans la manipulation de structures de données récurisves (*AST* par exemple). Il permet de définir un objet qui parcourra l'arbre sans se soucier des types des nœuds, ceux-ci devant respecter une certaine interface (une méthode leur permettant d'être visités).

### Décorateur

Le décorateur est un patron semblable aux décorateurs de Python. Il permet d'apporter facilement des modifications à une classe, et de chaîner différentes modifications.

### Code idiomatique

Pour terminer ce chapitre sur la conception, il semblait important d'aborder la notion de code « pythonnique ».
On rencontre souvent ce terme sur les forums, pour qualifier un code source Python bien conçu. On parle aussi de code idiomatique, car il est en accord avec les idiomes du langage.

Mais alors à quoi reconnaît-on un code pythonnique, et comment en écrire ?

* La *PEP20* (*The Zen of Python*) énonce les principales règles à respecter en Python
    * *Beautiful is better than ugly.* — Le beau est meilleur que le laid ;
    * *Explicit is better than implicit.* — L'explicite est meilleur que l'implicite ;
    * *Simple is better than complex.* — Le simple est meilleur que le complexe ;
    * *Complex is better than complicated.* — Le complexe est meilleur que le compliqué ;
    * *Flat is better than nested.* — Le plat est meilleur que l'imbriqué ;
    * *Sparse is better than dense.* — L'épars est meilleur que le dense ;
    * *Readability counts.* — La lisibilité compte ;
    * *Special cases aren't special enough to break the rules.* — Les cas spéciaux ne le sont pas assez pour briser les règles ;
    * *Although practicality beats purity.* — Bien que la praticabilité batte la pureté ;
    * *Errors should never pass silently.* — Les erreurs ne devraient jamais se produire silencieusement ;
    * *Unless explicitly silenced.* — Sauf si explicitement passées sous silence ;
    * *In the face of ambiguity, refuse the temptation to guess.* — En cas d'ambigüité, refuser la tentation de deviner ;
    * *There should be one-- and preferably only one --obvious way to do it.* — Il devrait y avoir une - et de préférence une seule - méthode évidente de faire ça ;
    * *Although that way may not be obvious at first unless you're Dutch.* — Bien que cette méthode puisse ne pas sembler évidente au premier abord, à moins que vous ne soyez chinois ;
    * *Now is better than never.* — Maintenant est meilleur que jamais ;
    * *Although never is often better than *right* now.* — Bien que jamais soit souvent préférable à tout de suite ;
    * *If the implementation is hard to explain, it's a bad idea.* — Si l'implémentation est difficile à expliquer, c'est une mauvaise idée ;
    * *If the implementation is easy to explain, it may be a good idea.* — Si l'implémentation est facile à expliquer, ça peut être une bonne idée ;
    * *Namespaces are one honking great idea -- let's do more of those!* — Les espaces de nommages sont une bonne idée, faisons-en plus !
* Il ressort de ces règles que la lisibilité et la simplicité du code sont très importantes en Python ;

Un beau code Python se reconnaît aussi par l'utilisation des outils du langage : itérateurs, générateurs, listes en intension, décorateurs, etc. Sans surexploiter ces derniers (on ne sort l'artillerie lourde que si nécessaire, si cela permet de gagner en lisibilité).
Ce point s'etend aussi par l'utilisation des bons modules de la bibliothèque standard (et de bibliothèques tierces) pour répondre aux besoins.

Les bonnes pratiques de programmation orientée objet énoncées plus tôt se retrouvent aussi dans un code idiomatique.
La présentation du code entre bien sûr en jeu, avec notamment la *PEP8*, la nomenclature des variables, la documetation (*docstrings*, annotations).

Pour terminer, voici quelques exemples de mauvais codes et leurs équivalents pythonniques.

```python
squares = []
i = 0
while i < 10:
    squares.append(i**2)
    i += 1
```

```python
squares = [i**2 for i in range(10)]
```
