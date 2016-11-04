module RNATranscription exposing (..)

import List exposing (head, filter, map)
import String exposing (join, split, toList)


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


getErr : Result String String -> Result Char String
getErr result =
    case result of
        Err str ->
            case head (toList str) of
                Just char ->
                    Err char

                Nothing ->
                    Err '_'

        _ ->
            Err '_'


formatOutput : List (Result String String) -> Result Char String
formatOutput complements =
    let
        errors =
            filter isError complements
    in
        case errors of
            [] ->
                Ok (join "" (complements |> map getVal))

            err :: _ ->
                getErr err


toRNA : String -> Result Char String
toRNA strand =
    (split "" strand)
        |> map complement
        |> formatOutput
