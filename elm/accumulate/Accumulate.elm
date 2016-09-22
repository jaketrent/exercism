module Accumulate exposing (..)


addToList : (a -> b) -> List a -> List b -> List b
addToList transform list newList =
    case list of
        [] ->
            newList

        first :: rest ->
            transform first
                :: []
                |> (++) newList
                |> addToList transform rest


accumulate : (a -> b) -> List a -> List b
accumulate transform list =
    addToList transform list []
