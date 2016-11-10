port module Main exposing (..)

import GradeSchoolTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit GradeSchoolTests.tests


port emit : ( String, Value ) -> Cmd msg
