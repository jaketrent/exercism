port module Main exposing (..)

import WordCountTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit WordCountTests.tests


port emit : ( String, Value ) -> Cmd msg
