
open System.Text.RegularExpressions

let chapterRx = new Regex("""<a name="%_chap_\d">""", RegexOptions.Compiled)    
let (|ChapterRx|_|) text =
    if chapterRx.IsMatch(text) then Some text else None
 
let sectionRx = new Regex("""<a name="%_sec_\d\.\d+"></a>""", RegexOptions.Compiled)    
let (|SectionRx|_|) text =
    if sectionRx.IsMatch(text) then Some text else None

//let epigraphRx = new Regex("""(?<=\<span class=epigraph>).*?(?=</span>)""", RegexOptions.Compiled ||| RegexOptions.Singleline)
let epigraphRx = new Regex("""<div align=right>.*?</div>""", RegexOptions.Compiled ||| RegexOptions.Singleline)
let (|EpigraphRx|_|) text =
    let m = epigraphRx.Match(text)
    if m.Success then Some m.Value else None
    
    
