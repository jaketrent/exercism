module Bob exposing (hey)

import Char exposing (isDigit, isLower, isUpper)
import String exposing (any, endsWith, isEmpty, toUpper, trim)

isAlpha : Char -> Bool
isAlpha char =
  isLower char || isUpper char

hey : String -> String
hey input =
  if any isAlpha input && input == toUpper input then
    "Whoa, chill out!"
  else if endsWith "?" input then
    "Sure."
  else if isEmpty (trim input) then
    "Fine. Be that way!"
  else
    "Whatever."
