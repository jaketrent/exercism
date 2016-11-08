module Series exposing (..)

import Char
import List
import String


toNum : Result String Int -> Int
toNum result =
    case result of
        Ok num ->
            num

        Err _ ->
            -1


slices : Int -> String -> Result String (List (List Int))
slices width str =
    let
        nonDigits =
            String.toList str
                |> List.filter (not << Char.isDigit)
    in
        if width == 0 then
            Err "Invalid size: 0"
        else if not (List.isEmpty nonDigits) then
            case List.head nonDigits of
                Just letter ->
                    Err ("could not convert string '" ++ (String.fromChar letter) ++ "' to an Int")

                Nothing ->
                    Err "could not convert string to all Ints"
        else
            [0..(String.length str - width)]
                |> List.map (\i -> String.slice i (i + width) str)
                |> List.map (String.split "")
                |> List.map (\l -> List.map String.toInt l)
                |> List.map (\l -> List.map toNum l)
                |> Ok
