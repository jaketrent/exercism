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


firstError : String -> Maybe Regex.Match
firstError strand =
    Regex.find (Regex.AtMost 1) (Regex.regex "[^CGTA]") strand
        |> List.head


toChar : String -> Char
toChar str =
    str |> String.toList |> List.head |> Maybe.withDefault '_'


toRNA : String -> Result Char String
toRNA strand =
    case firstError strand of
        Just { match } ->
            Err (toChar match)

        Nothing ->
            strand |> String.map mapComplement |> Ok
