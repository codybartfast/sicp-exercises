module Outline

open Model

let strId (Id str) = str
let strTitle (Title str) = str
let strHtml (Html str) = str


let block (block : Block) =
    seq{       
        yield 
            match block with
            | Block.Prose (Prose (Html str)) ->  
                sprintf "            Prose (%i)" str.Length
            | Block.Exercise ex -> 
                sprintf "            Exercise: %s (%i)" (strId ex.Id) (strHtml ex.Html).Length
    }

let chapter (chapter : Chapter) =
    seq{ 
        yield sprintf "    Chapter: %s - %s" (strId chapter.Id)  (strTitle chapter.Title)
    }

let subsection (subsection : Subsection) =
    seq{
        yield sprintf "          Subsection: %s - %s" (strId subsection.Id)  (strTitle subsection.Title)
        yield! subsection.Blocks |> Seq.collect block
    }

let section (section : Section) =
    seq{
        yield sprintf "        Section: %s - %s" (strId section.Id)  (strTitle section.Title)
        match section.Exercise with
        | Some ex -> yield! block (Block.Exercise ex)
        | None -> yield! Seq.empty
        yield! section.Subsections |> Seq.collect subsection
    }

let matter (matter : Matter) =
    seq{
        yield sprintf "    Matter: %s" (
            match matter.Title with
            | Some title -> strTitle title
            | None -> "")
    }

let outline (file : SicpFile) =
    seq{
        //yield sprintf "File: %A"  file.Id
        match file.Document with
            | Chapter doc -> yield! chapter doc
            | Section doc -> yield! section doc
            | Matter doc -> yield! matter doc }