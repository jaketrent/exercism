port module Main exposing (..)

import SumOfMultiplesTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit SumOfMultiplesTests.tests


port emit : ( String, Value ) -> Cmd msg
