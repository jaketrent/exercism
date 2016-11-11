module RNATranscription exposing (..)

import String


transcribe : Char -> Result Char String -> Result Char String
transcribe nucleotide result =
    case ( result, nucleotide ) of
        ( Ok rna, 'C' ) ->
            Ok (rna ++ "G")

        ( Ok rna, 'G' ) ->
            Ok (rna ++ "C")

        ( Ok rna, 'T' ) ->
            Ok (rna ++ "A")

        ( Ok rna, 'A' ) ->
            Ok (rna ++ "U")

        ( Err _, _ ) ->
            result

        _ ->
            Err nucleotide


toRNA : String -> Result Char String
toRNA strand =
    strand |> String.foldl transcribe (Ok "")
