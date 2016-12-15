module AtbashCipher exposing (..)

import Regex
import String


key =
    "abcdefghijklmnopqrstuvwxyz"


keyValue : Int -> String
keyValue i =
    case String.slice (-1 * i - 1) (-1 * i) key of
        "" ->
            "z"

        v ->
            v


keyIndex : String -> Maybe Int
keyIndex letter =
    key
        |> String.split ""
        |> List.indexedMap (,)
        |> List.filter (\( i, l ) -> l == letter)
        |> List.map fst
        |> List.minimum


groupBy5 : Int -> String -> String
groupBy5 index letter =
    if index > 0 && index % 5 == 0 then
        " " ++ letter
    else
        letter


convertAlpha : String -> String
convertAlpha letter =
    case keyIndex letter of
        Just i ->
            keyValue i

        Nothing ->
            letter


rmNonAlphaNumeric : String -> String
rmNonAlphaNumeric phrase =
    phrase |> Regex.replace Regex.All (Regex.regex "[^a-z0-9]") (\_ -> "")


cleanInput : String -> List String
cleanInput phrase =
    phrase
        |> String.toLower
        |> rmNonAlphaNumeric
        |> String.split ""


formatEncodeOutput : List String -> String
formatEncodeOutput letters =
    letters
        |> List.indexedMap groupBy5
        |> String.join ""


encode : String -> String
encode phrase =
    phrase
        |> cleanInput
        |> List.map convertAlpha
        |> formatEncodeOutput


decode phrase =
    phrase
        |> cleanInput
        |> List.map convertAlpha
        |> String.join ""
