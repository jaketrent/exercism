module Strain exposing (keep, discard)


keep : (a -> Bool) -> List a -> List a
keep filter collection =
    apply filter collection []


apply : (a -> Bool) -> List a -> List a -> List a
apply filter collection filtered =
    case collection of
        head :: tail ->
            let
                applied =
                    if filter head then
                        filtered ++ head :: []
                    else
                        filtered
            in
                apply filter tail applied

        [] ->
            filtered


discard : (a -> Bool) -> List a -> List a
discard filter collection =
    apply (not << filter) collection []
