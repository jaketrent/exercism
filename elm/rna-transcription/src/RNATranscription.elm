module RNATranscription exposing (..)

import Dict exposing (Dict)
import List
import Regex
import String


complements : Dict Char Char
complements =
    Dict.fromList [ ( 'G', 'C' ), ( 'C', 'G' ), ( 'T', 'A' ), ( 'A', 'U' ) ]


mapComplement : Char -> Char
mapComplement char =
    Dict.get char complements
        |> Maybe.withDefault char


toResult : String -> String -> Result Char String
toResult original complement =
    let
        firstMatch =
            Regex.find (Regex.AtMost 1) (Regex.regex "[^CGTA]") original
                |> List.head
    in
        case firstMatch of
            Just { match } ->
                Err (match |> String.toList |> List.head |> Maybe.withDefault '_')

            Nothing ->
                Ok complement


toRNA : String -> Result Char String
toRNA strand =
    String.map mapComplement strand |> toResult strand
