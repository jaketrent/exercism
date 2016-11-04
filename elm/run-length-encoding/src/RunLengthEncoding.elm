module RunLengthEncoding exposing (..)

import List exposing (any, foldl, head, isEmpty, length, reverse)
import String exposing (join, split, toInt)


version : Int
version =
    2


multiplyLetter : Int -> String -> String
multiplyLetter count char =
    [1..count]
        |> foldl (\_ acc -> acc ++ char) ""


buildLetters : List String -> String
buildLetters chars =
    chars
        |> foldl
            (\char ( nums, output ) ->
                case toInt char of
                    Ok _ ->
                        ( nums ++ char :: [], output )

                    Err _ ->
                        case toInt (join "" nums) of
                            Ok num ->
                                ( [], output ++ (multiplyLetter num char) :: [] )

                            Err err ->
                                ( [], output ++ char :: [] )
            )
            ( [], [] )
        |> snd
        |> join ""


decode : String -> String
decode str =
    buildLetters (split "" str)


stringToAppend : List String -> String
stringToAppend run =
    let
        count =
            (toString (length run))

        letter =
            case head run of
                Just letter ->
                    letter

                Nothing ->
                    ""
    in
        if length run > 1 then
            count ++ letter
        else
            letter


buildCode : List String -> List String -> String -> String
buildCode chars run output =
    case chars of
        [] ->
            output ++ (stringToAppend run)

        char :: restChars ->
            if (any (\c -> c == char) run) || (isEmpty run) then
                buildCode restChars (run ++ char :: []) output
            else
                buildCode restChars (char :: []) (output ++ (stringToAppend run))


encode : String -> String
encode str =
    buildCode (split "" str) [] ""
