module HelloWorld exposing (..)

import String exposing (concat)

helloWorld : Maybe String -> String
helloWorld name =
  let
    greet = 
      case name of
        Just name -> name
        Nothing -> "World"
  in
    concat ["Hello, ", greet, "!"]
