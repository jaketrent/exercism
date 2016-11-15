module Allergies exposing (..)

import Dict exposing (Dict)


items =
    Dict.fromList
        [ ( "eggs", 1 )
        , ( "peanuts", 2 )
        , ( "shellfish", 4 )
        , ( "strawberries", 8 )
        , ( "tomatoes", 16 )
        , ( "chocolate", 32 )
        , ( "pollen", 64 )
        , ( "cats", 128 )
        ]


isAllergicTo : String -> Int -> Bool
isAllergicTo item score =
    case Dict.get item items of
        Just itemScore ->
            score > 0 && score >= itemScore

        Nothing ->
            False


toList : Int -> List String
toList rawScore =
    let
        itemsTotalScore =
            items
                |> Dict.toList
                |> List.map snd
                |> List.sum

        score =
            if rawScore > itemsTotalScore then
                rawScore - itemsTotalScore - 1
            else
                rawScore
    in
        Dict.toList items
            |> List.sortBy snd
            |> List.reverse
            |> List.foldl
                (\( itemName, itemScore ) ( matching, scoreRemaining ) ->
                    let
                        newScore =
                            scoreRemaining - itemScore
                    in
                        if newScore >= 0 then
                            ( matching ++ itemName :: [], newScore )
                        else
                            ( matching, scoreRemaining )
                )
                ( [], score )
            |> fst
