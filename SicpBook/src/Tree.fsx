#load ".\Common.fsx"
#load ".\Regex.fsx"

open System.IO
open System.Text.RegularExpressions

open Regex

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

type File = { Id: Id; Content: FileContent }
and FileContent = 
    | Chapter of Chapter
    | Section of Section
    | Bookend of Bookend

and Chapter = { Id: Id; Title: Title; Epigraph: Epigraph; Prose: Prose; Html: Html}
and Section = { Id: Id; Title: Title; Prose: Prose; Subsections: Subsection list; Html: Html }
and Bookend = {Epigraph : Epigraph option; Prose: Prose}
and Subsection = { Id: Id; Title: Title; Text: Text list; Html: Html }
and Epigraph = Epigraph of Html
and Text = Prose | Exercise
and Prose = { Html: Html }
and Exercise = { Id: Id; Html: Html }
and Html = Html of string
and Id = Id of string
and Title = Title of string

let epigraph text =
    match text with
    | EpigraphRx t -> Some (Epigraph (Html t))
    | _ -> None

let bookend text = 
    Bookend {Epigraph = epigraph text; Prose = {Html = Html text}}

let parseFile (file : FileInfo) = 
    let text = File.ReadAllText(file.FullName);
    {    
        File.Id = Id file.Name;
        Content =      
            match text with
            | ChapterRx t -> Chapter {Id = Id "id"; Title = Title "title"; Epigraph = Epigraph (Html "epigraph"); Prose = {Html = Html "prose"}; Html = Html text}
            | SectionRx t -> Section {Id = Id "id"; Title = Title "title"; Prose = {Html = Html "prose"}; Subsections = []; Html = Html text}
            | _ -> bookend text
    }

let files =  htmlFiles |> Array.map parseFile

let go () =
    files 
        |> Array.iter (fun f ->        
            printfn "%A" (f.Content.GetType().Name))
    printfn "%i" files.Length

let six = 
    match files.[6].Content with
    | Bookend b -> b
    | _ -> failwith "hello there"

let e = six.Epigraph

let h = six.Prose.Html

let stringFromHtml = function Html s -> s

let s = stringFromHtml h