module Outline

open Model

let strId (Id str) = str
let strTitle (Title str) = str

let chapter (chapter : Chapter) =
    seq{ 
        yield sprintf "    Chapter %s: %s" (strId chapter.Id)  (strTitle chapter.Title)
    }

let section (section : Section) =
    seq{
        yield sprintf "        Section: %s: %s" (strId section.Id)  (strTitle section.Title)
        yield sprintf "%A" section.Prose
    }

let bookend (bookend : Bookend) =
    seq{
        yield sprintf "    Bookend: %A" (
            match bookend.Title with
            | Some title -> match title with Title text -> text
            | None -> "")
    }

let outline (file : SicpFile) =
    seq{
        //yield sprintf "File: %A"  file.Id
        match file.Document with
            | Chapter doc -> yield! chapter doc
            | Section doc -> yield! section doc
            | Bookend doc -> yield! bookend doc }