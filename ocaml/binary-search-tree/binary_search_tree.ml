open Base

type bst =
  | Empty
  | Node of {
    item: int;
    ltree: bst;
    rtree: bst;
  }

let empty: bst = Empty;;

let value tree = match tree with
  | Empty -> Error "empty tree"
  | Node {item; ltree; rtree} -> Ok item

let left tree = match tree with
  | Empty -> Error "empty tree"
  | Node {item; ltree; rtree} -> Ok ltree

let right tree = match tree with
  | Empty -> Error "empty tree"
  | Node {item; ltree; rtree} -> Ok rtree

let rec insert x tree = match tree with
  | Empty -> Node {item = x; ltree = Empty; rtree = Empty}
  | Node {item; ltree; rtree} when x < item -> Node {item; ltree= insert x ltree; rtree}
  | Node {item; ltree; rtree} when x > item -> Node {item; ltree; rtree = insert x rtree}
  | Node {item; ltree; rtree} when x == item -> Node {item; ltree = insert x ltree; rtree}


let rec to_list tree = match tree with
  | Empty -> []
  | Node {item; ltree; rtree} -> List.concat [(to_list ltree); [item]; (to_list rtree)]
