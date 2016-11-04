port module Main exposing (..)

import SublistTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit SublistTests.tests


port emit : ( String, Value ) -> Cmd msg
