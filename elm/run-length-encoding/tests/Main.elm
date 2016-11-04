port module Main exposing (..)

import RunLengthEncodingTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit RunLengthEncodingTests.tests


port emit : ( String, Value ) -> Cmd msg
