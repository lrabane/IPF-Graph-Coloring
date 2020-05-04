---
title: Rapport - Coloriage de graphe
author: Lucas Rabane
---

# Rapport

## Graphes non orientés

1) On reprends le même type et modules (`StringSet`, `StringMap`) que l'exercice 3 du TP4.

2) On reprends le `add_edge` de l'exercice 3 du TP4 mais on le fait pour les deux côtés afin de réaliser une arête non-orientée.

3) En premier lieu on retire l'association à `u` dans `g` puis on retire u dans tous les sommets.

## Coloriages disponibles

4) On reprends le module `Int` et `IntSet` de l'exercice 2 du TP4.

5) On reprends la fonction `range` de l'exercice 2 du TP4 puis on créé une simple fonction avec comment argument `n` qui appelle range avec comme arguments 1 et `n`.

6) On créé un simple type avec notre module `IntSet` précedemment créé et notre module `StringMap`.

7) On fait ça simplement en utilisant map où l'on associe `color_set` pour chaque sommet du graphe.

8) On cherche les couleurs disponibles du sommet `v` dans notre graphe `g` puis on ajoute dans notre graphe `g` cette ensemble des couleurs avec la couleur `i` retiré.

## Coloriage

9) On définit une simple exception `Failed`

10) On reprends l'algorithme présenté dans le sujet du projet et on l'écrit en OCaml

11) On créé un simple type avec le type `int` et notre module `StringMap`.

12) Appel initial à la fonction `color` : 

On choisit un sommet `v` avec ses voisins `vn`
On récupère les couleurs disponibles du sommet `v` et on stocke ça dans `s`
On démarre l’appel de la fonction `traitement` via la fonction `try_first`

Ensuite dans `try_first` puis `traitement`

On choisit une couleur aléatoirement (`i`) dans l’ensemble de couleurs disponibles du sommet v (passé en param). On prend chaque couleur ensuite, et si le sommet actuel à chaque fois (`v’`) est voisin (`vn`) de `v`, alors on enlève la couleur `i` des couleurs disponibles, et on applique la fonction `color` à nouveau sur le graphe d’entrée amputé du sommet choisi plus haut (`v`).
