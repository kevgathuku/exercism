(** list-ops exercise *)

(*
Please don't use any external modules (especially List) in your
implementation. The point of this exercise is to create these basic functions
yourself.

Note that `++` is a function from an external module (Pervasives, which is
automatically opened) and so shouldn't be used either.
*)

val length : 'a list -> int

val reverse : 'a list -> 'a list

val map : f:('a -> 'b) -> 'a list -> 'b list

val filter : f:('a -> bool) -> 'a list -> 'a list

(* ~init is used as a named argument *)
(* You need to include the ~ in the recursive function call to refer to individual arguments *)
val fold : init:'acc -> f:('acc -> 'a -> 'acc) -> 'a list -> 'acc

(* Evaluates the list from the last element to the first. *)
(* Returns elements in the order it received them *)
(* These are no longer named arguments, but positional arguments *)
val fold_right : 'b -> ('a -> 'b -> 'b) -> 'a list -> 'b

(* Appends elements in list_b to list_a and returns a new list *)
(* Starts with list_b elements, then prepends list_a elements, from last to first *)
val append : 'a list -> 'a list -> 'a list

(* Merges two lists into one *)
val concat : 'a list list -> 'a list
