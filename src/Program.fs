open System

open Outline
open Model

[<EntryPoint>]
let main argv =
    let files = Files.files ()
    
    let sectOfDoc (Section sect) = sect

    files
    |> Seq.collect outline
    |> Seq.iter (printfn "%s")

    let file = files.[10]
    let sect = sectOfDoc file.Document
    let sub = sect.Subsections.[6]

    //printfn "%A" sub

    Console.ReadKey() |> ignore
    0