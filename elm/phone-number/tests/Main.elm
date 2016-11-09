port module Main exposing (..)

import PhoneNumberTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit PhoneNumberTests.tests


port emit : ( String, Value ) -> Cmd msg
