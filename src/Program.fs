open System
open System.Text

open Exercises
open Outline
open Model


// http://www.fileformat.info/info/unicode/char/b2/browsertest.htm
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
        |> List.skip 9
        
    xx |> Seq.iter (fun x ->
        Console.Clear ()
        desc x
        Console.ReadKey () |> ignore
        )
    
    printfn "%s" "Done."
    Console.ReadKey() |> ignore
    0