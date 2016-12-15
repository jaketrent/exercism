port module Main exposing (..)

import AtbashCipherTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit AtbashCipherTests.tests


port emit : ( String, Value ) -> Cmd msg
