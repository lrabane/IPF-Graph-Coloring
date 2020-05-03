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

(* 12 *)
let rec color g c =
  if StringMap.is_empty g = false then (* g non vide du coup on continue *)
  let (v, vn) = StringMap.choose g in (* sommet v choisi, et vn ses neighbors *)
  let traitement i =
    let c' = StringMap.mapi ( (* on prend chaque couleur dispo *)
        fun v' s' ->
        if StringSet.mem v' vn (* si le sommet actuel [v'] est voisin du sommet v choisi plus haut *)
        then IntSet.remove i s' (* => enlever cette couleur des couleurs possibles *)
        else s' ) c in (* sinon on change rien *)
    let g' = remove_vertex v g in (* on enleve le sommet v choisi plus haut, au graphe *)
    StringMap.add v i (color g' c') (* et on applique la fonction color sur ce graphe resultant *)
  in
  let s = StringMap.find v c in 
  try_first traitement s
  else
  StringMap.empty (* g vide pas de coloriage possible *)
