port module Main exposing (..)

import SpaceAgeTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit SpaceAgeTests.tests


port emit : ( String, Value ) -> Cmd msg
