port module Main exposing (..)

import DifferenceOfSquaresTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit DifferenceOfSquaresTests.tests


port emit : ( String, Value ) -> Cmd msg
