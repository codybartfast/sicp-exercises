open System.IO

let htmlDir = 
    (new FileInfo(__SOURCE_DIRECTORY__ + @"\..\book-html")).FullName

let xmlDir = 
    (new FileInfo(__SOURCE_DIRECTORY__ + @"\..\book-xml")).FullName

