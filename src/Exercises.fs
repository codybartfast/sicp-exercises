module Exercises

open System
open System.IO
open System.Text
open System.Text.RegularExpressions

open Common
open Model

let NL = "\r\n"
let NLNL = NL + NL
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
let rxList pattern string = 
    string
    |> (fun table -> Regex.Matches(table, pattern, RegexOptions.Singleline))
    |> Seq.cast<Match>
    |> Seq.map(fun m -> m.Value)
    |> List.ofSeq


let getHtml src =
    src
    |> strHtml
    |> rxRemove """<a name="%_(idx|thm)_\d.\d+"></a>\s*"""
    |> rxRemove """(<p>\s*)*$""" 

let formatPara (m : Match) =
    //">" +
    m.Value
    |> rxReplace "\s*\n" (fun m -> " ")
    |> rxRemove "(?<![.?]) +(?= )" 
    |> rxReplace ("(?<line>\G.{0," + lineLenStr + "}) +") (fun m->
         m.Groups.["line"].Value + NL)    

let handleRef (links : ResizeArray<Link>) prefix (m: Match) =
    let urlPath = m.Groups.["path"].Value
    let text = m.Groups.["text"].Value
    links.Add(
      { Text = sprintf "%s %s" prefix text; 
        Path = urlPath})
    sprintf "[%s]" text

let handleLinks (links : ResizeArray<Link>) html =
    html
    |> rxReplace 
        """<a\s+href="(?<path>(book-Z-H-\d+.html)?#%_sec_[.\d]+)">(?<text>[.\d]+)</a>""" 
        (handleRef links "Section")

let handleExLinks (links : ResizeArray<Link>) html =
    html
    |> rxReplace
        """<a\s*href="(book-Z-H-\d+.html)?(?<path>#%_thm_\d\.\d+)">(?<text>\d\.\d+)</a>"""
        (handleRef links "Exercise")

let handleFootnoteRef (links : ResizeArray<Link>) html =
    html
    |> rxReplace
        """<a href="(book-Z-H-\d+.html)?(?<path>#footnote_Temp_\d+)">(?<text>\d+)</a>"""
        (handleRef links "Footnote")

let handleFigureRef (links : ResizeArray<Link>) html =
    html
    |> rxReplace
        """<a href="(?<path>#%_fig_\d.\d+)">(?<text>\d\.\d+)</a>"""
        (handleRef links "Figure")

let textImage kind filename =
    let file = FileInfo (Path.Combine(exerciseImages, filename + ".txt"))
    match file.Exists with
    | true ->  File.ReadAllText(file.FullName)
    | false -> sprintf "[%s: %s]" kind filename

let handleImage (m : Match) =
    let filename = m.Groups.["filename"].Value
    NLNL + (textImage "Image" filename) + NLNL

let handleFigure (m : Match) =
    let filename = m.Groups.["filename"].Value
    let id = m.Groups.["id"].Value
    let text = m.Groups.["text"].Value
    NLNL  
        //textImage "Figure" filename
        + "Figure:" + NLNL
        + m.Groups.["content"].Value
        + NLNL
        + sprintf "Figure %s  %s" id text
//        + NLNL
//        + "[[[[" + m.Value + "]]]]"
//        + NLNL
//        + "{{{{" + m.Groups.["wild"].Value + "}}}}"

let sup (text : string) =
    let supChar c =
        match c with 
        | '[' -> '⁽'
        | '0' -> '⁰'
        | '1' -> '¹'
        | '2' -> '²'
        | '3' -> '³'
        | '4' -> '⁴'
        | '5' -> '⁵'
        | '6' -> '⁶'
        | '7' -> '⁷'
        | '8' -> '⁸'
        | '9' -> '⁹'
        | ']' -> '⁾'
        | c -> c
    text.ToCharArray()
        |> Array.map supChar
        |> String   

// ₁ \u2081 ₂ \u2082
let handleSubs (m : Match) =
    match m.Groups.["sub"].Value with
    | "1" -> "₁"  // \u2081
    | "2" -> "₂"  // \u2082
    | "3" -> "₃"  // \u2083
    | "i" -> "ᵢ"  // \u1D62
    | "0" -> "₀"  
    | sub -> sprintf "_(%s)" sub

let handleSymbolImage (m : Match) =
    match m.Groups.["inum"].Value with
    | "11" -> "ɸ"
    | "12" -> "ψ"
    | "13" -> "√"
    | "20" -> "≈" 
    | "14" -> "←" // \u2190
    | "3"  -> "θ"
    | "9"  -> "π"
    | "17" -> "→" // \u2192
    | "6"  -> "λ" // \u03BB
    | "19"  -> "∫" // \u222B
    | _ -> m.Value

let handleFootnotes (links : ResizeArray<Link>) html =
    html
    |> rxReplace 
        """<a name="call_footnote_Temp_\d+" href="(?<path>#footnote_Temp_\d+)"><sup><small>(?<text>\d+)</small></sup></a>""" 
        ((handleRef links "Footnote") >> sup)

let handleSymbols text = 
    text
    |> rxReplace "``(?<quoted>[^`)<]+)''" (fun m ->  sprintf "\"%s\"" m.Groups.["quoted"].Value)
    |> rxReplace "(&quot;)" (fun m -> "\"")
    |> rxReplace "(&quot;)" (fun m -> "\"")
    |> rxReplace "(&middot;)" (fun m -> "·")
    |> rxReplace "<sup>2</sup>" (fun m -> "²")
    |> rxReplace "<sup>3</sup>" (fun m -> "³")
    |> rxReplace "<sup>5</sup>" (fun m -> "⁵")
    |> rxReplace "<sup>a</sup>" (fun m -> "^a")
    |> rxReplace "<sup>b</sup>" (fun m -> "^b")
    |> rxReplace "<sup>n</sup>" (fun m -> "ⁿ")
    |> rxReplace "<sub>0</sub><sup>t</sup>" (fun m -> "_(0)^t ")
    |> rxReplace "<u><</u>\s*" (fun m -> "≤")
    |> rxReplace "<u>></u>\s*" (fun m -> "≥")
    |> rxReplace "<sup>x</sup>" (fun m -> "^x")
    |> rxReplace "<sup>n/2</sup>" (fun m -> "^(n/2)")
    |> rxReplace "<sup>n-1</sup>" (fun m -> "ⁿ⁻¹")
    |> rxReplace "<sub>(?<sub>[^<]+)</sub>" handleSubs
    |> rxReplace ("""<img src="images/book-Z-G-D-(?<inum>""" +
        "11|12|13|20|14|3|9|17|6|19" 
        + """).gif" border="0">""")
        handleSymbolImage

let handleTable (m : Match) =
    let rec transpose  =
        function
        | (_::_)::_ as M -> 
            (List.map List.head M) :: transpose (List.map List.tail M)
        | _ -> []
    let rowStrings = 
        m.Value
        |> rxList "(?<=<tr>).*?(?=</tr>)"
    let rows =
        rowStrings
        |> List.map (rxList @"(?<=<td[^>]+>\s*)[^<]+?(?=\s*</td>)")
    let cols = transpose rows
    let cellLengths = 
        cols
        |> List.map (fun col ->
            col
            |> List.map(fun cell -> cell.Length)
            |> List.max )
    NLNL +
      ( rows
        |> List.map (fun row ->
            (row, cellLengths) ||> List.map2 (fun cell len -> cell.PadRight(len))
            |> String.concat " ")
        |> String.concat "\r\n")
        + NLNL


let getText html =
    html        
    |> rxReplace "\.\.\.</tt><tt>\.\.\." (fun m -> sprintf "...%s..." NLNL)
    |> rxRemove "</?(tt|ul)>|" 
    |> rxReplace "&nbsp;" (fun m -> " ")
    |> rxReplace "&lt;" (fun m -> "<")
    |> rxReplace "&gt;" (fun m -> ">")
    |> rxReplace "<li>" (fun m -> "* ")
    |> rxReplace """^<b>(?<title>.*?)\.</b>\s*""" (fun m ->
        let title = m.Groups.["title"].Value
        let underline = new String('=', title.Length)
        title + NL + underline + NL + NL)
    |> rxReplace "<i>|</i>|<em>|</em>|<strong>|</strong>" (fun m -> "") 
    |> handleSymbols
    |> rxReplace """\s*(<p>|<br>)(\r?\n)?""" (fun m -> NL)
    |> rxReplace """(?<=</div>)|(?=\<div)""" (fun m -> NLNL)
    |> rxReplace """(?<=\n)([A-Z]|[a-w])(([^\r\n](?!(</td>|</td>)))+\r?\n)+""" formatPara
    //|> rxReplace """(?<=\n)([A-Z]|[a-w])([^\r\n]+\r?\n)+""" formatPara
    |> rxReplace ("""(?x)
        <a\s*name=[^<]+</a>\s*
        <div[^>]+><table[^>]+><tr><td>
        \s*<div[^>]+>

        (?<content>.*?)

        </td></tr><caption[^<]+<div [^<]+<b>Figure\s*
            (?<id>\d\.\d+)   
        :</b>\s*        
            (?<text>[^<]+)        
        </div>\s*</caption><tr><td>\s*</td></tr></table></div>""")
        handleFigure
    |> rxReplace """<table\ .+?(BOOM|Mary|associated).+?</table>""" handleTable
    |> rxReplace 
        """(</div>\s+)?(<div\s+align=left>)?<img\s+src="images/(?<filename>ch\d-Z-G-\d+.gif)"\s+border="0">(</div>)?""" 
        handleImage
    |> rxReplace """(\r?\n)( *\r?\n){1,}""" (fun m -> NL + NL)
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
        |> handleExLinks links
        |> handleFootnotes links 
        |> handleFootnoteRef links
        |> handleFigureRef links

    let links = 
        links
        |> Seq.distinctBy(fun l -> l.Text)
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
            [single];
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
