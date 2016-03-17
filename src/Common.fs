module Common

open System.IO

let getDirectory parentPath childName =
    let path = Path.Combine(parentPath, childName)
    let dir = new DirectoryInfo(path)
    dir.Create()
    dir.FullName

let htmlRoot = 
    let relativePath = __SOURCE_DIRECTORY__ + @"\..\html"
    let rootPath = (new DirectoryInfo(relativePath)).FullName
    getDirectory rootPath ""

let htmlImages = getDirectory htmlRoot "images"

let htmlStylesheets = getDirectory htmlRoot "stylesheets"


