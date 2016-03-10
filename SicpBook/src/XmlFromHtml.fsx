#load ".\Common.fsx"

open System.IO
open System.Text.RegularExpressions

let htmlDir = Common.htmlDir
printfn "Got Html Directory: %s" htmlDir

let fileSortKey file =
    match Regex.Match(file, @"\d+").Value with
        | "" -> "0"
        | text -> text
    |> int

let htmlFiles = 
    Directory.GetFiles(htmlDir, "*.html") 
    |> Array.sortBy fileSortKey

let xmlEscapeRx = new Regex("""[&<>'"]""", RegexOptions.Compiled)
let xmlEscape text = 
    xmlEscapeRx.Replace(text, (fun (m : Match) ->
        match m.Value with
        | "&" -> "&amp;"
        | "<" -> "&lt;"
        | ">" -> "&gt;"
        | "'" -> "&apos;"
        | "\"" -> "&quot;"
        | unexpected -> failwith "got unexpected: " + unexpected))
    

let content = 
    Array.head htmlFiles
    |> File.ReadAllText
    |> xmlEscape




