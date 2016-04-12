open System
open System.Text

open Exercises
open Outline
open Model
open Publish

let displayConsole skip exercises =
    let display ex =
        Console.Clear()
        printfn "%s" ex.ExStandard
        Console.ReadKey () |> ignore
    exercises
        |> List.skip skip
        |> List.iter display

[<EntryPoint>]
let main argv =    
    let exercises =
        Files.files ()
        |> allExercises 
        |> List.ofSeq

    exercises 
        |> publish
    
    exercises
        |> displayConsole (46 + 97 + 77) //82 + 79 + 46)        
    
    printfn "%s" "Done."
    0