module Model

type Part = { String : string; Start : int; End : int}
type Place = { String : string; Index : int }

type SicpFile = { Id: Id; Document: Document }
and Document = 
    | Chapter of Chapter
    | Section of Section
    | Matter of Matter
and Chapter = { Id: Id; Title: Title; Epigraph: Epigraph; Prose: Prose; Html: Html}
and Section = { Id: Id; Title: Title; Prose: Prose; Exercise: ExerciseSrc option; Subsections: Subsection list; Html: Html }
and Matter = { Title: Title option; Epigraph : Epigraph option; Prose: Prose; Html: Html}
and Subsection = { Id: Id; Title: Title; Blocks: Block list; Html: Html }
and Epigraph = Epigraph of string
and Block = 
    | Prose of Prose
    | Exercise of ExerciseSrc
and Prose = Prose of Html
and ExerciseSrc = { Id: Id; Html: Html }
and Html = Html of string
and Id = Id of string
and Title = Title of string

let strId (Id str) = str
let strTitle (Title str) = str
let strHtml (Html str) = str