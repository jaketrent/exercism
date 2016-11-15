port module Main exposing (..)

import AllergiesTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit AllergiesTests.tests


port emit : ( String, Value ) -> Cmd msg
