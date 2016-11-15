port module Main exposing (..)

import RobotSimulatorTests
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
    run emit RobotSimulatorTests.tests


port emit : ( String, Value ) -> Cmd msg
