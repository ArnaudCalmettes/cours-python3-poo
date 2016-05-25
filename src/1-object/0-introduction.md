Objet
=====

Tout d'abord, qu'est-ce qu'un objet ? En introduction, nous avons dit qu'un objet avait des propriétés
et pouvait être manipulé avec des opérations, c'est bien beau tout ça mais qu'est-ce que ça peut
bien vouloir dire concrétement ?

Pour vous éclairer, prenons le code suivant :

```python
def mk_personne(nom, prenom, age):
    return {
        'nom': nom,
        'prenom': prenom,
        'age': age
    }

def nom(personne, val=None):
    if val is not None:
        personne['nom'] = val
    return personne['nom']

def prenom(personne, val=None):
    if val is not None:
        personne['prenom'] = val
    return personne['prenom']

def age(personne, val=None):
    if val is not None:
        personne['age'] = val
    return personne['age']

def saluer(personne):
    print("Hello, {} {} !".format(prenom(personne), nom(personne))
```

Maintenant, définissons deux personnes avec leur nom, leur prénom et leur âge :

```python
personne1 = mk_personne("Poirot", "Hercule", 55)
personne2 = mk_personne("Holmes", "Sherlock", 60)
```

Puis saluons-les comme il se doit :

```python
saluer(personne1) #Affiche : 'Hello, Hercule Poirot !'
saluer(personne2) #Affiche : 'Hello, Sherlock Holmes !'
```

Si nous souhaitons en savoir un peu plus sur eux (leur prénom, leur nom et leur âge) ou même
changer ces informations, nous le pouvons aussi :

```python
print("J'ai {} ans.".format(age(personne1)))
#Affiche : 'J'ai 55 ans.'
print("Ah non, j'ai {} ans depuis hier en fait... Euh...".format(age(personne1, 56)))
#Affiche : 'Ah non, j'ai 56 ans depuis hier en fait... Euh...'
```

Si vous relisez notre définition d'objet, vous vous rendrez compte que nous venons d'en manipuler, du moins en quelque sorte.
En effet, nous avons défini (ou *instancié*) des personnes en donnant des valeurs à leurs propriétés (ou *attributs*) : nom, prénom et âge.
Ces derniers étaient stockés dans un dictionnaire avec des couples 'nom de l'attribut : valeur'.
Ensuite, nous avons interagi avec ces personnes, notamment en utilisant la fonction (ou *méthode*) 'saluer'.

Nos personnes étaient donc comme des objets. En réalité, beaucoup de choses peuvent se modéliser par un objet et
en Python, tout est objet, mais nous en reparlerons plus tard. Pour le moment, intéressons nous à ce qui définit un objet.
