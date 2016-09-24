module Anagram exposing (..)

import List exposing (filter, foldl, sort)
import Regex exposing (contains, caseInsensitive, regex)
import String exposing (split, toLower)


type alias Word =
    String


isSameWord : Word -> Word -> Bool
isSameWord src word =
    src == word


containsEveryLetter : Word -> Word -> Bool
containsEveryLetter src word =
    let
        srcLetters =
            sort (split "" src)

        wordLetters =
            sort (split "" word)
    in
        srcLetters == wordLetters


isAnagramOf : Word -> Word -> Bool
isAnagramOf mixedCaseSrc mixedCaseWord =
    let
        src =
            toLower mixedCaseSrc

        word =
            toLower mixedCaseWord
    in
        not (isSameWord src word)
            && containsEveryLetter src word


detect : Word -> List Word -> List Word
detect src words =
    filter (isAnagramOf src) words
