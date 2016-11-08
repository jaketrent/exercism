port module Main exposing (..)

import NucleotideCountTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit NucleotideCountTests.tests


port emit : ( String, Value ) -> Cmd msg
