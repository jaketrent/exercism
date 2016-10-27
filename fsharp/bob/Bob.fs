module Bob

open System
open System.Linq

let hey (input : string) =
    match input with
      | input when input.Trim() = String.Empty -> "Fine. Be that way!"
      | input when (input.Any(fun x -> System.Char.IsLetter x)) && input.ToUpper() = input -> "Whoa, chill out!"
      | input when input.EndsWith("?") -> "Sure."
      | input -> "Whatever."