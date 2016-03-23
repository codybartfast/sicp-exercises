module Exercises

open System.IO

open Common
open Model

type Exercise = {
    Source : ExerciseSrc
    File : SicpFile
    UrlPath : string
}

let exerciseFromSource file exSrc = {
    Source = exSrc
    File = file
    UrlPath = (strId file.Id) + "#%_thm_" + (strId exSrc.Id)//book-Z-H-11.html#%_thm_1.15
    }

let exercisesFromSubsection file sub  =
        sub.Blocks
        |> Seq.choose (fun block ->
            match block with
            | Exercise ex -> Some (exerciseFromSource file ex)
            | _ -> None)
    

let exercisesFromFile file =
    seq{
        match file.Document with
        | Document.Section section ->
            if section.Exercise.IsSome 
            then yield exerciseFromSource file section.Exercise.Value
            yield! 
                section.Subsections
                |> Seq.collect (exercisesFromSubsection file)
        | _ -> yield! Seq.empty
    }

let allExercises files = files |> Seq.collect exercisesFromFile

let write ex =
    let dir = exerciseRoot
    let path = Path.Combine(dir, strId ex.Id + ".txt")
    File.WriteAllText(path, strHtml ex.Html)

let desc ex =
    printfn "Id: %s" (strId ex.Source.Id)
//    printfn "Text:"
//    printfn "%s" (strHtml ex.Source.Html)
    printfn "Link: http://sicp-book.com/%s" ex.UrlPath
    printfn ""