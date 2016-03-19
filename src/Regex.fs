module Regex

open System.Text.RegularExpressions

let titleRx = 
    new Regex(
        """<h[123].*?
            (?<id>\d(\.\d){0,2})?
            ">(\d+(\.\d)*&nbsp;&nbsp;)? 
            (?<title>[^<]+(<tt>[^<]+</tt>([^<]+)?)?) 
            </a></h[123]>
            <p>"""
            , RegexOptions.Compiled ||| RegexOptions.Singleline ||| RegexOptions.IgnorePatternWhitespace)

let epigraphRx = new Regex("""<p>\s+<div align=right>.*?</div>\s+<p><p>""", RegexOptions.Compiled ||| RegexOptions.Singleline)

let proseRx = 
    new Regex(""".*?(?=<p><div class=navigation>\[Go to|<a name="%_sec_\d\.\d\.\d)"""
    , RegexOptions.Compiled ||| RegexOptions.Singleline )

let chapterRx = new Regex("""<a name="%_chap_\d">""", RegexOptions.Compiled)    
let (|ChapterRx|_|) text =
    if chapterRx.IsMatch(text) then Some text else None
 
let sectionRx = new Regex("""<a name="%_sec_\d\.\d+"></a>""", RegexOptions.Compiled)    
let (|SectionRx|_|) text =
    if sectionRx.IsMatch(text) then Some text else None

let subsectionRx = 
    new Regex("""
        <h3>.*?
        (?=
            <h3>
          | <div\ class=smallprint><hr></div>
        )
        """, RegexOptions.Compiled ||| RegexOptions.Singleline ||| RegexOptions.IgnorePatternWhitespace)

let blockRx = 
    new Regex("""
        \G
        (
            (?<exercise>
               <a\ name="%_thm_ (?<id>\d\.\d+)
               .+?
               Exercise\ \d\.\d+
               .+?
               </a>
               .+?
            )
        |
            (?<prose> .+? )
        )
        (?= 
            <h3> 
            | <a\ name="%_thm_
            | <div\ class=smallprint><hr></div>
            | $
        )
    """, RegexOptions.Compiled ||| RegexOptions.Singleline ||| RegexOptions.IgnorePatternWhitespace)

//            # (?= <div\ class=smallprint><hr></div>)
