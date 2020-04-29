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