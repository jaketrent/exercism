module WordCount exposing (..)

import Char exposing (isUpper, isLower)
import Dict exposing (Dict)
import Regex exposing (..)
import String exposing (toLower, words)


countWords : List String -> Dict String Int -> Dict String Int
countWords words counts =
    let
        incrementCount i =
            case i of
                Nothing ->
                    Just 1

                Just i ->
                    Just (i + 1)
    in
        case words of
            [] ->
                counts

            word :: rest ->
                countWords rest (Dict.update word incrementCount counts)


parseWords : String -> List String
parseWords sentence =
    sentence
        |> String.words
        |> List.map (\word -> replace All (regex "[^\\w]") (\_ -> "") word)
        |> List.filter (\w -> not (String.isEmpty w))
        |> List.map (\w -> toLower w)


wordCount : String -> Dict String Int
wordCount sentence =
    countWords (parseWords sentence) Dict.empty
