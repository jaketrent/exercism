module PhoneNumber exposing (..)

import Char
import List
import String


prettyPrint : String -> Maybe String
prettyPrint str =
    let
        fullPhone =
            if (String.length str > 10) then
                String.slice 1 (String.length str) str
            else
                str

        areaCode =
            String.slice 0 3 fullPhone

        firstThree =
            String.slice 3 6 fullPhone

        lastFour =
            String.slice 6 10 fullPhone
    in
        Just ("(" ++ areaCode ++ ") " ++ firstThree ++ "-" ++ lastFour)


formatOutput : List String -> String
formatOutput strs =
    strs |> String.join ""


ifLength : Int -> (List String -> List String) -> List String -> List String
ifLength len transform strs =
    if List.length strs == len then
        transform strs
    else
        strs


stripLeadingOne : List String -> List String
stripLeadingOne strs =
    case strs of
        "1" :: rest ->
            rest

        _ ->
            strs


ifTrueTransform : (a -> Bool) -> (a -> a) -> a -> a
ifTrueTransform predicate transform data =
    ifTrueTransformElse predicate transform (\d -> d) data


ifTrueTransformElse : (a -> Bool) -> (a -> b) -> (a -> b) -> a -> b
ifTrueTransformElse predicate transformIf transformElse data =
    if predicate data then
        transformIf data
    else
        transformElse data


getNumber : String -> Maybe String
getNumber str =
    String.toList str
        |> List.filter Char.isDigit
        |> List.map String.fromChar
        |> ifTrueTransform (\strs -> List.length strs == 11) stripLeadingOne
        |> formatOutput
        |> ifTrueTransformElse (\s -> String.length s == 10) (\s -> Just s) (\s -> Nothing)
