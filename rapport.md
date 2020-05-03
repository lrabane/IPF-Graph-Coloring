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

12) On choisit une couleur aléatoirement (`i`). On choisit un sommet (`v`) aléatoirement et on récupère ses voisins (`vn`).  On prend toutes les couleurs disponibles (de `c`), et si le sommet actuel (de la couleur, `v’`) est voisin du sommet choisi (`vn`) alors on enlève la couleur choisie (`i`) des couleurs possibles (`s’`). On passe récursivement sur la fonction avec le graphe d’entrée amputé du sommet choisi plus haut (`v`).
