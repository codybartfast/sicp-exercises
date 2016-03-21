module Exercises

open System.IO

open Common
open Model

let exercisesFromSubsection sub  =
        sub.Blocks
        |> Seq.choose (fun block ->
            match block with
            | Exercise ex -> Some ex
            | _ -> None)
    

let exercisesFromFile file =
    seq{
        match file.Document with
        | Document.Section section ->
            if section.Exercise.IsSome 
            then yield section.Exercise.Value
            yield! 
                section.Subsections
                |> Seq.collect exercisesFromSubsection            
        | _ -> yield! Seq.empty
    }

let allExercises files = files |> Seq.collect exercisesFromFile

let write ex =
    let dir = exerciseRoot
    let path = Path.Combine(dir, strId ex.Id + ".txt")
    File.WriteAllText(path, strHtml ex.Html)