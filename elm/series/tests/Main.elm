port module Main exposing (..)

import SeriesTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit SeriesTests.tests


port emit : ( String, Value ) -> Cmd msg
