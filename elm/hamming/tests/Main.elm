port module Main exposing (..)

import HammingTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit HammingTests.tests


port emit : ( String, Value ) -> Cmd msg
