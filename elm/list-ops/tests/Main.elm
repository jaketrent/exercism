port module Main exposing (..)

import ListOpsTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit ListOpsTests.tests


port emit : ( String, Value ) -> Cmd msg
