open System

open Exercises
open Outline
open Model

[<EntryPoint>]
let main argv =
    let files = Files.files ()
    
//    files
//    |> Seq.collect outline
//    |> Seq.iter (printfn "%s")

    let exercises = 
        files 
        |> allExercises 
        |> List.ofSeq
    
    let xx = exercises |> List.take 5
    xx |> Seq.iter desc

    printfn "%s" "Done."
    Console.ReadKey() |> ignore
    0