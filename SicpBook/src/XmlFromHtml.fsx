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
    (new DirectoryInfo(htmlDir)).GetFiles("*.html")
    |> Array.sortBy (fun file -> fileSortKey file.FullName)

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

type File = { Id: Id; Content: Content }
and Content = 
    | Bookend of Html
    | Chapter of Chapter
    | Section of Section

and Chapter = { Id: Id; Title: Title; Epigraph: Epigraph; Prose: Prose; Html: Html}
and Section = { Id: Id; Title: Title; Prose: Prose; Subsections: Subsection list; Html: Html }
and Subsection = { Id: Id; Title: Title; Text: Text list; Html: Html }
and Epigraph = Epigraph of Html
and Text = Prose | Exercise
and Prose = { Html: Html }
and Exercise = { Id: Id; Html: Html }
and Html = Html of string
and Id = Id of string
and Title = Title of string

let parseText text = text |> Html |> Bookend

let parseFile (file : FileInfo) = {
    File.Id = Id file.Name;
    Content =  (parseText (File.ReadAllText(file.FullName)));
    }

let files = 
    htmlFiles
    |> Array.map parseFile
    |> Array.head
