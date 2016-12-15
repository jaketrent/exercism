port module Main exposing (..)

import ScrabbleScoreTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit ScrabbleScoreTests.tests


port emit : ( String, Value ) -> Cmd msg
