## Attributs

Ensuite, un objet est constitué d'attributs. Ces derniers représentent des valeurs propres à l'objet. Si nous reprenons notre code,
une personne a un nom, un prénom et un âge. Nous pouvons en général accéder et modifier facilement ces valeurs.

En Python, nous pouvons facilement associer des valeurs à nos objets :

```python
#Ne pas se soucier de cela pour le moment
class Object(object):
    pass

#Instanciation d'un objet de type Object
voiture = Object()
#Définition d'attributs pour cet objet
voiture.couleur = "rouge"
voiture.nombre_places = 5
#Présentation de l'objet
print("Je suis une voiture {}.".format(voiture.couleur))
print("J'ai {} places.".format(voiture.nombre_places))
```

Le code ci-dessus affiche :

```text
Je suis une voiture rouge.
J'ai 5 places.
```

Nous avons créé un objet nommé `voiture`, de type `Object`, auquel nous avons attribué une couleur ainsi qu'un nombre de places.
Puis nous avons affiché ces valeurs. Vous remarquerez que bien qu'une voiture soit un objet, il aurait été plus précis que son type soit 'Voiture'.
