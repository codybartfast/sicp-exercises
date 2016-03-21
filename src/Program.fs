open System

open Exercises
open Outline
open Model

[<EntryPoint>]
let main argv =
    let files = Files.files ()
    
    let sectOfDoc (Section sect) = sect

    files
    |> Seq.collect outline
    |> Seq.iter (printfn "%s")

    files
    |> allExercises
    |> Seq.iter write

//    let file = files.[10]
//    let sect = sectOfDoc file.Document
//    let sub = sect.Subsections.[6]
//
//    //printfn "%A" sub

    printfn "%s" "Done."
    Console.ReadKey() |> ignore
    0