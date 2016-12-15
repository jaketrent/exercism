module ScrabbleScore exposing (scoreWord)

import String


scores =
    [ ( 1, [ "a", "e", "i", "o", "u", "l", "n", "r", "s", "t" ] )
    , ( 2, [ "d", "g" ] )
    , ( 3, [ "b", "c", "m", "p" ] )
    , ( 4, [ "f", "h", "v", "w", "y" ] )
    , ( 5, [ "k" ] )
    , ( 8, [ "j", "x" ] )
    , ( 10, [ "q", "z" ] )
    ]


findScore letter =
    scores
        |> List.filter (\s -> List.member letter (snd s))
        |> List.foldl (\s _ -> fst s) 0


scoreWord letters =
    letters
        |> String.toLower
        |> String.split ""
        |> List.foldl (\l acc -> acc + findScore l) 0
