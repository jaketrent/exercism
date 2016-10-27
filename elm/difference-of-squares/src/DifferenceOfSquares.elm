module DifferenceOfSquares exposing (..)

import List exposing (map, sum)


squareOfSum : Int -> Int
squareOfSum num =
    (sum [1..num]) ^ 2


sumOfSquares : Int -> Int
sumOfSquares num =
    sum (map (\n -> n ^ 2) [1..num])


difference : Int -> Int
difference num =
    (squareOfSum num) - (sumOfSquares num)
