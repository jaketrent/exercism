port module Main exposing (..)

import AnagramTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit AnagramTests.tests


port emit : ( String, Value ) -> Cmd msg
