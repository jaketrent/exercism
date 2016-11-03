port module Main exposing (..)

import RNATranscriptionTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit RNATranscriptionTests.tests


port emit : ( String, Value ) -> Cmd msg
