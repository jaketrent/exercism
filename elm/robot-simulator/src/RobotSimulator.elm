module RobotSimulator exposing (..)

import String


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


type Bearing
    = North
    | East
    | West
    | South


turnRight robot =
    case robot.bearing of
        North ->
            { robot | bearing = East }

        East ->
            { robot | bearing = South }

        South ->
            { robot | bearing = West }

        West ->
            { robot | bearing = North }


turnLeft robot =
    case robot.bearing of
        North ->
            { robot | bearing = West }

        West ->
            { robot | bearing = South }

        South ->
            { robot | bearing = East }

        East ->
            { robot | bearing = North }


advance robot =
    case robot.bearing of
        North ->
            { robot | coordinates = { x = robot.coordinates.x, y = robot.coordinates.y + 1 } }

        East ->
            { robot | coordinates = { x = robot.coordinates.x + 1, y = robot.coordinates.y } }

        South ->
            { robot | coordinates = { x = robot.coordinates.x, y = robot.coordinates.y - 1 } }

        West ->
            { robot | coordinates = { x = robot.coordinates.x - 1, y = robot.coordinates.y } }


simulate : String -> Robot -> Robot
simulate directions robot =
    directions
        |> String.split ""
        |> List.foldl
            (\direction robot ->
                case direction of
                    "L" ->
                        turnLeft robot

                    "A" ->
                        advance robot

                    "R" ->
                        turnRight robot

                    _ ->
                        robot
            )
            robot
