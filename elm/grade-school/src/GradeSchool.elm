module GradeSchool exposing (..)

import Dict exposing (Dict)
import List


type alias Student =
    ( Int, String )


type alias Grade =
    ( Int, List String )


empty : List Student
empty =
    []


addStudent : Int -> String -> List Student -> List Student
addStudent grade name students =
    students ++ ( grade, name ) :: []


studentsInGrade : Int -> List Student -> List String
studentsInGrade grade students =
    students
        |> List.filter (\s -> (fst s) == grade)
        |> List.map (\s -> snd s)
        |> List.sort


allStudents : List Student -> List Grade
allStudents students =
    students
        |> List.foldl
            (\( grade, name ) grades ->
                let
                    appendName entry =
                        case entry of
                            Just names ->
                                Just (names ++ name :: [] |> List.sort)

                            Nothing ->
                                Just (name :: [])
                in
                    Dict.update grade appendName grades
            )
            Dict.empty
        |> Dict.toList
