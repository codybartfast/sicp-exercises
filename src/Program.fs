open System

open Outline

[<EntryPoint>]
let main argv =
    let files = Files.files
    
    files
    |> Seq.collect outline
    |> Seq.iter (printfn "%s")

    // printfn "Hello, World! %s"  (string files.Length)
    Console.ReadKey() |> ignore
    0