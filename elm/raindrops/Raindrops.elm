module Raindrops exposing (..)

import String 

raindrops : Int -> String
raindrops num =
  let 
    pling = if num % 3 == 0 then "Pling" else ""
    plang = if num % 5 == 0 then "Plang" else ""
    plong = if num % 7 == 0 then "Plong" else ""
    drops = String.concat [pling, plang, plong]
  in
    if String.isEmpty drops then
      toString num
    else
      drops
