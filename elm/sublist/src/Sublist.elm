module Sublist exposing (..)

import List exposing (foldl)
import String exposing (contains)


version : Int
version =
    2


type ListComparison
    = Equal
    | Unequal
    | Sublist
    | Superlist


listToString : List Int -> String
listToString list =
    list |> foldl (\n acc -> acc ++ (toString n)) ""


sublist : List Int -> List Int -> ListComparison
sublist l1 l2 =
    let
        list1 =
            listToString l1

        list2 =
            listToString l2
    in
        if list1 == list2 then
            Equal
        else if contains list1 list2 then
            Sublist
        else if contains list2 list1 then
            Superlist
        else
            Unequal
