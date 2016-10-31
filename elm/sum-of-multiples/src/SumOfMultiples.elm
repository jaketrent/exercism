module SumOfMultiples exposing (..)

import List
import Set


findMultiples : Int -> Int -> Int -> List Int -> List Int
findMultiples num i max multiples =
    let
        product =
            num * i
    in
        if product >= max then
            multiples
        else
            findMultiples num (i + 1) max (multiples ++ product :: [])


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples nums max =
    nums
        |> List.map (\n -> findMultiples n 1 max [])
        |> List.foldl (\m acc -> acc ++ m) []
        |> Set.fromList
        |> Set.foldl (\n acc -> acc + n) 0
