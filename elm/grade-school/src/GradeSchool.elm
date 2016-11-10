module GradeSchool exposing (..)

import Dict exposing (Dict)
import List


type alias Student =
    ( Int, String )


type alias Grades =
    Dict Int (List String)


type alias GradeList =
    List ( Int, List String )


empty : Grades
empty =
    Dict.empty


addStudent : Int -> String -> Grades -> Grades
addStudent grade name grades =
    Dict.update grade (appendName name) grades


studentsInGrade : Int -> Grades -> List String
studentsInGrade grade grades =
    Dict.get grade grades
        |> Maybe.withDefault []
        |> List.sort


appendName : String -> Maybe (List String) -> Maybe (List String)
appendName name names =
    Just <| name :: Maybe.withDefault [] names


allStudents : Grades -> GradeList
allStudents grades =
    grades |> Dict.toList
