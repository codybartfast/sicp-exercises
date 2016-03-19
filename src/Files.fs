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

let matchPlaces regex place =
    let matches = 
        subsectionRx.Matches(place.String, place.Index)
        |> Seq.cast<Match>
        |> List.ofSeq
    let places =
        matches 
        |> List.map (fun m -> {place with Index = m.Index})
    let lastMatch = matches |> List.last
    let endPlace = {place with Index = lastMatch.Index + lastMatch.Length}
    places, endPlace

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

let block place = 
    Block.Prose (Prose (Html "bloc")), place

let blocks place =
    let blockPlaces, endPlace = matchPlaces blockRx place
    let blocks = 
        blockPlaces
        |> List.map (block >> fst)
    blocks, place
    
let subsection place =
    let id, title, place = title place
    //let blocks, _ = blocks place
    {
        Subsection.Id = id.Value;
        Title = title.Value;
        Blocks = [];
        Html = Html place.String
    }, place

let subsections place =   
    let ssPlaces, endPlace = matchPlaces subsectionRx place
    let subsections = 
        ssPlaces 
        |> List.map (subsection >> fst)
    subsections, endPlace
    
let section place =
    let id, title, place = title place
    //let x = match id with Some id -> id | None -> failwith "No !"
    let prose, place = prose place
    let subsections, place = subsections place
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

