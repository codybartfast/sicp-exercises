module Exercises

open System
open System.IO
open System.Text.RegularExpressions

open Common
open Model

let NL = "\r\n"
let lineLength = 72
let lineLenStr = lineLength.ToString()

let bookUrl = "http://sicp-book.com/"

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
    |> rxRemove """<a name="%_(idx|thm)_\d.\d+"></a>\s*"""
    |> rxRemove """(<p>\s*)*$""" 

let formatPara (m : Match) =
    m.Value
    |> rxReplace "\s*\n" (fun m -> " ")
    |> rxRemove "(?<![.?]) +(?= )" 
    |> rxReplace ("(?<line>\G.{0," + lineLenStr + "}) ") (fun m->
         m.Groups.["line"].Value + NL)
    //|> (fun txt -> txt + NL)

let getText html =
    html        
    |> rxRemove "</?tt>" 
    |> rxReplace "&nbsp;" (fun m -> " ")
    |> rxReplace "&lt;" (fun m -> "<")
    |> rxReplace "&gt;" (fun m -> "<")
    |> rxReplace """\s*(<p>|<br>)(\r?\n)?""" (fun m -> NL)
    |> rxReplace """(\r?\n){2,}""" (fun m -> NL + NL)
    |> rxReplace """^<b>(?<title>.*?)\.</b>\s*""" (fun m ->
        let title = m.Groups.["title"].Value
        let underline = new String('=', title.Length)
        title + NL + underline + NL + NL)
    |> rxReplace """(?<=\n)([A-Z]|[a-z]\. )([^\r\n]+\r?\n)+""" formatPara
    |> rxReplace "[\r\n]*$" (fun m -> NL)

let withMatter ex =
    String.Concat(
        String ('=', lineLength), NL, NL,
        ex.Text, NL,
        new String('-', lineLength), NL,
        "[Exercise ", strId ex.Source.Id, "]: ", bookUrl, ex.UrlPath, NL,
        String ('-', lineLength)
    )
    |> fun text -> Regex.Replace(text, "^",  ";   ", RegexOptions.Multiline) 
        

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

let write (ex : Exercise) =
    let dir = exerciseRoot
    let path = Path.Combine(dir, strId ex.Source.Id + ".txt")
    File.WriteAllText(path, withMatter ex)

let desc ex =
    printfn "%s" (withMatter ex)
