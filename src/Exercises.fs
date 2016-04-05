module Exercises

open System
open System.IO
open System.Text
open System.Text.RegularExpressions

open Common
open Model

let NL = "  \r\n" // spaces to make Markdown friendly
let lineLength = 72
let lineLenStr = lineLength.ToString()

let bookUrl path = "http://sicp-book.com/" + path

type Link = {Text:string; Path:string}

type Exercise = {
    Source: ExerciseSrc
    File: SicpFile
    UrlPath: string
    Id: string
    Html: string
    Text: string
    Links: Link list
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
    
let handleImage (m : Match) =
    let textImage filename =
        let file = FileInfo (Path.Combine(exerciseImages, filename + ".txt"))
        match file.Exists with
        | false -> sprintf "[image: %s]" filename
        | true -> File.ReadAllText(file.FullName)
    let filename = m.Groups.["filename"].Value
    NL + (textImage filename) + NL


let sup (text : string) =
    let supChar c =
        match c with 
        | '[' -> '⁽'
        | '1' -> '¹'
        | '2' -> '²'
        | '3' -> '³'
        | '5' -> '⁵'
        | ']' -> '⁾'
        | c -> c
    text.ToCharArray()
        |> Array.map supChar
        |> String

let handleRef (links : ResizeArray<Link>) prefix (m: Match) =
    let urlPath = m.Groups.["path"].Value
    let text = m.Groups.["text"].Value
    links.Add(
        {
        Text = sprintf "%s %s" prefix text; 
        Path = urlPath})
    sprintf "[%s]" text

let handleLinks (links : ResizeArray<Link>) html =
    html
    |> rxReplace 
        """<a\s+href="(?<path>book-Z-H-12.html#%_sec_1.3.4)">(?<text>1.3.4)</a>""" 
        (handleRef links "Link")

let handleFootnotes (links : ResizeArray<Link>) html =
    html
    |> rxReplace 
        """<a name="call_footnote_Temp_\d+" href="(?<path>#footnote_Temp_\d+)"><sup><small>(?<text>\d+)</small></sup></a>""" 
        ((handleRef links "Footnote") >> sup)
  

let handleSymbols text = 
    text
    |> rxReplace "(''|``)" (fun m -> "\"")
    |> rxReplace "<sup>2</sup>" (fun m -> "²")
    |> rxReplace "<u>></u>\s*" (fun m -> "≥")

let getText html =
    html        
    |> rxRemove "</?tt>" 
    |> rxReplace "&nbsp;" (fun m -> " ")
    |> rxReplace "&lt;" (fun m -> "<")
    |> rxReplace "&gt;" (fun m -> ">")
    |> rxReplace """\s*(<p>|<br>)(\r?\n)?""" (fun m -> NL)
    |> rxReplace """^<b>(?<title>.*?)\.</b>\s*""" (fun m ->
        let title = m.Groups.["title"].Value
        let underline = new String('=', title.Length)
        title + NL + underline + NL + NL)
    |> rxReplace "<i>|</i>|<em>|</em>" (fun m -> "") 
    |> rxReplace """<div\s+align=left><img\s+src="images/(?<filename>ch\d-Z-G-\d+.gif)" border="0"></div>""" handleImage
    |> handleSymbols
    |> rxReplace """(\r?\n){2,}""" (fun m -> NL + NL)
    |> rxReplace """(?<=\n)([A-Z]|[a-z]\. )([^\r\n]+\r?\n)+""" formatPara
    |> rxReplace "[\r\n]*$" (fun m -> NL)


let exerciseFromSource (file : SicpFile) (exSrc : ExerciseSrc) = 
    let addFile ref = (strId file.Id) + ref
    let links = ResizeArray<Link>()
    let exLink =     
      { Text = "Exercise " + strId exSrc.Id
        Path = "#%_thm_" + (strId exSrc.Id)}
    links.Add exLink

    let html = getHtml exSrc.Html
    let text = 
        html
        |> handleLinks links 
        |> handleFootnotes links

    let links = 
        links
        |> Seq.map (fun link ->
            if link.Path.StartsWith("#") then
                { link with Path = addFile link.Path}
            else link)
    
    let exercise =
      { Source = exSrc
        File = file
        UrlPath = exLink.Path
        Id = strId exSrc.Id
        Html = html
        Text = getText text
        Links =  links |> Seq.toList }
    exercise

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

let withMatter ex =
    let double = String ('=', lineLength)
    let single = String ('-', lineLength)

    let linkLines = 
        ex.Links
        |> List.map (fun link ->
            ("[" + link.Text + "]: ").PadRight(17) + bookUrl link.Path + NL)
            
    let commented = 
        List.concat [
            [
                double; NL; NL;
                ex.Text;
                single; NL;
            ];
            linkLines;
            [ single];
        ]
        |> String.Concat
        |> fun text -> Regex.Replace(text, "^",  ";   ", RegexOptions.Multiline)    
    let uncommented =  
        [
            NL; NL;
            sprintf """(output "%s")""" ex.Id;
            NL; NL; NL;
            "(end)";   
        ]        
        |> String.Concat
    commented + uncommented

let write (ex : Exercise) =
    let dir = exerciseRoot
    let path = Path.Combine(dir, strId ex.Source.Id + ".txt")
    File.WriteAllText( path, withMatter ex, Encoding.UTF8)

let desc ex =
    printfn "%s" (withMatter ex)
