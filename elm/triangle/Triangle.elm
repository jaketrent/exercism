module Triangle exposing (..)


version : Int
version =
    2


type alias Side =
    Float


type alias Equilateral =
    String


type alias Isosceles =
    String


type alias Scalene =
    String


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Side -> Side -> Side -> Result String Triangle
triangleKind s1 s2 s3 =
    if s1 <= 0 || s2 <= 0 || s3 <= 0 then
        (Err "Invalid lengths")
    else if (s1 + s2 < s3) || (s1 + s3 < s2) || (s2 + s3 < s1) then
        (Err "Violates inequality")
    else if s1 == s2 && s1 == s3 && s2 == s3 then
        (Ok Equilateral)
    else if s1 == s2 || s1 == s3 || s2 == s3 then
        (Ok Isosceles)
    else
        (Ok Scalene)
