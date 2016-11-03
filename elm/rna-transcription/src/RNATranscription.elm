module RNATranscription exposing (..)

import List exposing (filter, map)
import String exposing (join, split)


complement : String -> Result String String
complement nucleotide =
    case nucleotide of
        "C" ->
            Ok "G"

        "G" ->
            Ok "C"

        "T" ->
            Ok "A"

        "A" ->
            Ok "U"

        _ ->
            Err nucleotide


isError : Result String String -> Bool
isError result =
    case result of
        Err err ->
            True

        Ok val ->
            False


getVal : Result String String -> String
getVal result =
    case result of
        Ok val ->
            val

        _ ->
            "_"


formatOutput : List (Result String String) -> Result String String
formatOutput complements =
    let
        errors =
            filter isError complements
    in
        case errors of
            [] ->
                Ok (join "" (complements |> map getVal))

            err :: _ ->
                err


toRNA : String -> Result String String
toRNA strand =
    (split "" strand)
        |> map complement
        |> formatOutput
