module Outline

open Model

let outline (file : SicpFile) =
    printfn "File: %A"  file.Id