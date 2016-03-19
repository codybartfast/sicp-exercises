module Files

open System
open System.IO
open System.Text.RegularExpressions

open Common
open Model
open Regex
open Outline

let htmlRoot = Common.htmlRoot
//printfn "Got Html Directory: %s" htmlRoot

let fileSortKey file =
    match Regex.Match(file, @"\d+").Value with
        | "" -> "0"
        | text -> text
    |> int

let htmlFiles = 
    (new DirectoryInfo(htmlRoot)).GetFiles("*.html")
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

let matchParts (regex : Regex) place =
    let matches = 
        regex.Matches(place.String, place.Index)
        |> Seq.cast<Match>
        |> List.ofSeq
    let parts =
        matches 
        |> List.map (fun m -> {Start = m.Index; End = m.Index + m.Length; String = place.String})
//    let lastMatch = matches |> List.last
//    let endPlace = {place with Index = lastMatch.Index + lastMatch.Length}
    parts//, endPlace

let title place =    
    let m = titleRx.Match(place.String, place.Index)
    match m.Success with
    | false -> None, None, place
    | true -> 
    //printfn "========= Title %s" m.Value
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

let matter place = 
    let _, title, place = title place
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Matter {
        Title = title;
        Epigraph = epigraph; 
        Prose = prose;
        Html = Html place.String }

let chapter place =
    let id, title, place = title place
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Chapter{
        Id = id.Value;
        Title = title.Value;
        Epigraph = epigraph.Value;
        Prose = prose;
        Html = Html place.String;
    }

let block (part : Part) = 
    let str = part.String
    Block.Prose (Prose (Html str))

let blocks place =
    let blockParts = matchParts blockRx place
    let blocks = 
        blockParts
        |> List.map block
    blocks
    
let subsection (part : Part) =
    let id, title, place = title {String = part.String; Index = part.Start; }
    let blocks = blocks place
    {
        Subsection.Id = id.Value;
        Title = title.Value;
        Blocks = blocks;
        Html = Html place.String
    }, place

let subsections place =   
    let ssPlaces = matchParts subsectionRx place
    let subsections = 
        ssPlaces 
        |> List.map (subsection >> fst)
    subsections
    
let section place =
    let id, title, place = title place
    let prose, place = prose place
    let subsections = subsections place
    Section{
        Id = id.Value;
        Title = title.Value;
        Prose = prose;
        Subsections = subsections;
        Html = Html place.String;
    }

let parseFile (file : FileInfo) = 
    let text = File.ReadAllText(file.FullName)
    let place = {String = text; Index = 0;}
    {    
        SicpFile.Id = Id file.Name;
        Document =      
            match text with
            | ChapterRx t -> chapter place
            | SectionRx t -> section place
            | _ -> matter place
    }

let files () =  htmlFiles |> Array.map parseFile

