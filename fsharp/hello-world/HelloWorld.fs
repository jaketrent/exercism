namespace HelloWorld

// open System

module HelloWorld = 
  let hello name =
      sprintf "Hello, %s!" (defaultArg name "World")


// module Main =
//     HelloWorld.hello "Justin"
