
open System.Text.RegularExpressions

let (|ChapterRx|_|) text =
    let m = Regex.Match(text, ">Chapter \d<")
    if m.Success then Some text else None
    
