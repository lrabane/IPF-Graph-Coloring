(* 1 *)

module StringSet = Set.Make(String)
module StringMap = Map.Make(String)

type graph = StringSet.t StringMap.t

(* 2 *)

let add_edge u v g =
  let add_oriented_edge v1 v2 g =
    let s =
      try
        StringMap.find v1 g
      with
        Not_found -> StringSet.empty
    in
    let s' = StringSet.add v2 s in
    StringMap.add v1 s' g in
  let g = add_oriented_edge u v g in
  add_oriented_edge v u g

(* 3 *)

let remove_vertex u g =
  let g' = StringMap.remove u g in
  
  StringMap.map
  (fun s -> StringSet.remove u s)
  g'

(* 4 *)    

module Int = struct
  type t = int
  let compare = fun x y -> x - y
end
  
module IntSet = Set.Make(Int)

(* 5 *)

let rec range a b =
  if a = b then IntSet.singleton a
  else IntSet.add a (range (a+1) b)

let color_set n =
  range 1 n

(* 6 *)

type disp_color = IntSet.t StringMap.t

(* 7 *)

let init_colors g k =
  StringMap.map
    (fun s -> color_set k)
    g

(* 8 *)

let remove_color i v c =
  let s = StringMap.find v c in
  StringMap.add v (IntSet.remove i s) c

(* 9 *)

exception Failed

(* 10 *)

let rec try_first f s =
  if IntSet.is_empty s then raise (Failed) else
  let i = IntSet.choose s in
  try
    f i
  with 
    Failed -> try_first f (IntSet.remove i s)

(* 11 *)

type coloring = int StringMap.t

(* 12 - WIP (ne fonctionne pas encore) *)
let rec color g c =
  if StringMap.is_empty g = false then (* Si g n'est pas vide alors faire le traitement suivant *)
  let (s, sv) = StringMap.choose g in (* On choisi un noeud dans le graph g *)
  let _ = IntSet.map (fun color_c -> (* Boucle dans les couleurs disponibles de s (s : le noeud sélectionné dans choose) *)
  let c' = StringMap.fold(fun noeud_c value_noeud_c result-> (* On enlève la couleur color_c dans sv qui sont les voisins de s *)
                          let element =
                          try
                          StringSet.find noeud_c sv
                          with
                          Not_found -> "" in
                          if element <> "" then remove_color color_c noeud_c result else result) c c in
  let g' = remove_vertex s g in (* On enlève s dans g' *)
  let col =
  try
  StringMap.add s color_c (color g' c) (* Problème comment détecter si col a bien renvoyé une valeur *)
  with
  (Failed error_string) -> None
  in
  if col <> None then StringMap.add s color_c col else Printf.printf "Next\n"
  ) (StringMap.find s c) in 
  raise (Failed "Erreur fin de parcours des couleurs") (* Erreur après la bouble sur toutes couleurs disponibles *)
  else 
  StringMap.empty (* Si le graph g est vide on retourne une StringMap vide qui sera le fond de la fonction récursive *)


(*
let my_graph =
  let g = add_edge "f" "d" StringMap.empty in
  let g = add_edge "f" "e" g in
  let g = add_edge "d" "e" g in
  let g = add_edge "d" "b" g in 
  let g = add_edge "d" "a" g in
  let g = add_edge "e" "a" g in
  add_edge "a" "c" g
*)