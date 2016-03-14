﻿#load ".\Common.fsx"
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

type File = { Id: Id; Document: Document }
and Document = 
    | Chapter of Chapter
    | Section of Section
    | Bookend of Bookend

and Chapter = { Id: Id; Title: Title; Epigraph: Epigraph; Prose: Prose; Html: Html}
and Section = { Id: Id; Title: Title; Prose: Prose; Subsections: Subsection list; Html: Html }
and Bookend = { Title: Title option; Epigraph : Epigraph option; Prose: Prose; Html: Html}
and Subsection = { Id: Id; Title: Title; Text: Text list; Html: Html }
and Epigraph = Epigraph of string
and Text = Prose | Exercise
and Prose = Prose of Html
and Exercise = { Id: Id; Html: Html }
and Html = Html of string
and Id = Id of string
and Title = Title of string

let title place =    
    let m = titleRx.Match(place.String, place.Index)
    match m.Success with
    | false -> None, None, place
    | true -> 
    let title = Some (Title m.Groups.["title"].Value)

    let mId = m.Groups.["id"]
    let id = 
        match mId.Success with
        | true -> Some (Id mId.Value)
        | false -> None
    (id, title, {place with Index = m.Index + m.Length})

let epigraph place =
    let m = epigraphRx.Match(place.String, place.Index)
    let e =  
        match m.Success with
        | true -> Some (Epigraph m.Value)
        | false -> None
    (e, {place with Index = m.Index + m.Length})

let prose place =
    let m = proseRx.Match(place.String, place.Index)
    (Prose (Html m.Value), {place with Index = m.Index})

let bookend place = 
    let _, title, place = title place
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Bookend {
        Title = title;
        Epigraph = epigraph; 
        Prose = prose;
        Html = Html place.String }

let chapter place =
    let id, title, place = title place
    printfn "====================== %A:%A" id title
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Chapter{
        Id = id.Value;
        Title = title.Value;
        Epigraph = epigraph.Value;
        Prose = prose;
        Html = Html place.String;
    }


let parseFile (file : FileInfo) = 
    let text = File.ReadAllText(file.FullName)
    let place = {String = text; Index = 0;}
    {    
        File.Id = Id file.Name;
        Document =      
            match text with
            | ChapterRx t -> chapter place
            | SectionRx t -> Section {Id = Id "id"; Title = Title "title"; Prose = Prose (Html "prose"); Subsections = []; Html = Html text}
            | _ -> bookend place
    }

let files =  htmlFiles |> Array.map parseFile


let go () =
    files 
        |> Array.iter (fun f ->        
            printfn "%A" (f.Document.GetType().Name))
    printfn "%i" files.Length

let six = 
    match files.[9].Document with
    | Chapter c -> c
    | _ -> failwith "hello there"

let ts = 
    six.Title
//    |> function 
//        | Some t -> ( t |> (function Title s -> s)) 
//        | None  -> "no title"

let ps = 
    six.Prose
    |> function Prose h -> h
    |> function Html s -> s