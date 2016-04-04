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

    exercises 
        |> List.iter write
    
    let xx = 
        exercises 
        |> List.skip 10
        
    xx |> Seq.iter (fun x ->
        Console.Clear ()
        desc x
        Console.ReadKey () |> ignore
        )
    

    printfn "%s" "Done."
    Console.ReadKey() |> ignore
    0