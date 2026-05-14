fun isBalanced s =
  let
    fun loop (chars, stack) =
      case chars of
        [] => List.null stack
      | c :: rest =>
          case c of
            #"{" => loop (rest, c :: stack)
          | #"[" => loop (rest, c :: stack)
          | #"(" => loop (rest, c :: stack)
          | #"}" =>
              (case stack of
                 #"{" :: stackRest => loop (rest, stackRest)
               | _ => false)

          | #"]" =>
              (case stack of
                 #"[" :: stackRest => loop (rest, stackRest)
               | _ => false)
          | #")" =>
              (case stack of
                 #"(" :: stackRest => loop (rest, stackRest)
               | _ => false)

          | _ => loop (rest, stack)
  in
    loop (String.explode s, [])
  end
