## Recettes

On trouve en programmation orientée objet des patrons de conception (*design patterns*) qui répondent à différents besoins dans l'architecture des programmes.
Ceux-ci sont conçus pour des langages assez pauvres et/ou rigides, et se révèlent souvent peu utiles en Python, car déjà couverts par le langage, ou inadaptés à ses abstractions.

Les recettes sont plutôt un recueil de petites classes/fonctions qui reprennent les grandes idées de ces patrons de conception pour les adapter au Python.

### Visiteur

Le visiteur est un patron très utilisé dans la manipulation de structures de données récurisves (*AST* par exemple). Il permet de définir un objet qui parcourra l'arbre sans se soucier des types des nœuds, ceux-ci devant respecter une certaine interface (une méthode leur permettant d'être visités).

### Décorateur

Le décorateur est un patron semblable aux décorateurs de Python. Il permet d'apporter facilement des modifications à une classe, et de composer ces différentes variations.
