module Hamming exposing (..)

import List exposing (map, map2, sum)
import String exposing (length, toList)


distance : String -> String -> Maybe Int
distance strand1 strand2 =
    let
        distance =
            map2 (,) (toList strand1) (toList strand2)
                |> map
                    (\( nucleotide1, nucleotide2 ) ->
                        if nucleotide1 == nucleotide2 then
                            0
                        else
                            1
                    )
                |> sum
    in
        if length strand1 == length strand2 then
            Just distance
        else
            Nothing
