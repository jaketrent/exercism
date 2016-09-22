module Pangram exposing (isPangram)

import List exposing (foldl)
import Regex exposing (contains, caseInsensitive, regex)
import String exposing (isEmpty, split)


isPangram : String -> Bool
isPangram str =
    let
        alpha =
            (split "" "abcdefghijklmnopqrstuvwxyz")

        startsWithAlpha =
            not (isEmpty str)

        containsAllLetters =
            \letter acc ->
                acc
                    && (contains
                            (caseInsensitive (regex letter))
                            str
                       )
    in
        foldl containsAllLetters startsWithAlpha alpha
