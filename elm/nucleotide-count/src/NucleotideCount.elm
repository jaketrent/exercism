module NucleotideCount exposing (..)

import String exposing (foldl)


version : Int
version =
    2


type alias Counts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> Counts
nucleotideCounts strand =
    strand
        |> foldl
            (\nucleotide counts ->
                case nucleotide of
                    'A' ->
                        { counts | a = counts.a + 1 }

                    'T' ->
                        { counts | t = counts.t + 1 }

                    'C' ->
                        { counts | c = counts.c + 1 }

                    'G' ->
                        { counts | g = counts.g + 1 }

                    _ ->
                        counts
            )
            (Counts 0 0 0 0)
