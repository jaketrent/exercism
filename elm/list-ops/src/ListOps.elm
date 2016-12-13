module ListOps exposing (..)

import List


length : List a -> Int
length list =
    List.length list


reverse : List a -> List a
reverse list =
    list |> List.reverse


map : (a -> b) -> List a -> List b
map fn list =
    list |> List.map fn


filter : (a -> Bool) -> List a -> List a
filter fn list =
    list |> List.filter fn


foldl : (a -> b -> b) -> b -> List a -> b
foldl fn acc list =
    List.foldl fn acc list


foldr : (a -> b -> b) -> b -> List a -> b
foldr fn acc list =
    List.foldr fn acc list


append : List a -> List a -> List a
append list1 list2 =
    list1 ++ list2


concat : List (List a) -> List a
concat lists =
    List.foldl (\l acc -> acc ++ l) [] lists
