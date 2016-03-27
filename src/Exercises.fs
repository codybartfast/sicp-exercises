module Exercises

open System
open System.IO
open System.Text.RegularExpressions

open Common
open Model

let NL = "\r\n"

type Exercise = {
    Source: ExerciseSrc
    File: SicpFile
    UrlPath: string
    Html: string
    Text: string
}

let rxReplace pattern (eval : Match -> string) string = Regex.Replace(string, pattern, eval, RegexOptions.Singleline)
let rxRemove pattern string = rxReplace pattern (fun s -> "") string

let getHtml src =
    src
    |> strHtml
    |> rxRemove """^(<a name="%_idx_\d+">)?<a name="%_thm_\d.\d+"></a>\s+"""
    |> rxRemove """(<p>\s*)*$"""

let getText html =
    html        
    |> rxRemove "</?tt>" 
    |> rxReplace "&nbsp;" (fun m -> " ")
    |> rxReplace "&lt;" (fun m -> "<")
    |> rxReplace "&gt;" (fun m -> "<")
    |> rxReplace """\s*(<p>|<br>)(\r?\n)?""" (fun m -> "\r\n")
    |> rxReplace """(\r?\n){2,}""" (fun m -> "\r\n\r\n")
    |> rxReplace """^<b>(?<title>.*?)\.</b>\s*""" (fun m ->
        let title = m.Groups.["title"].Value
        let underline = new String('=', title.Length)
        title + NL + underline + NL
    )

let exerciseFromSource file (exSrc : ExerciseSrc) = 
    let html = getHtml exSrc.Html
    {   Source = exSrc
        File = file
        UrlPath = (strId file.Id) + "#%_thm_" + (strId exSrc.Id)
        Html = html
        Text = getText html
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
    printfn "%s" (new String('=', 72))
    printfn "Id: %s" (strId ex.Source.Id)
    printfn "Link: http://sicp-book.com/%s" ex.UrlPath
    printfn "Text:"
    printfn "%s" ex.Text
    printfn ""