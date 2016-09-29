port module Main exposing (..)

import StrainTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit StrainTests.tests


port emit : ( String, Value ) -> Cmd msg
