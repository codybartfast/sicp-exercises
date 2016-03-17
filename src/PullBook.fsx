#r "System.Net.Http.dll"

open System
open System.IO
open System.Net.Http
open System.Text
open System.Text.RegularExpressions
open System.Threading.Tasks
open System.Collections.Generic

# load ".\Common.fs"
open Common
    
let toText = Encoding.ASCII.GetString

let print text =     
    printfn "%s" text
    text

let client = new HttpClient()
let download baseUrl file=
    client.GetByteArrayAsync(baseUrl + file : string).Result    

let saveText saveDir file text =
    File.WriteAllText(Path.Combine(saveDir, file), text)
    text

let downloadAndSave baseUrl saveDir file =
    let save saveDir file bytes =
        File.WriteAllBytes(Path.Combine(saveDir, file), bytes)
        bytes
    file 
    |> download baseUrl
    |> save saveDir file
    
let splitUrl url =
     (* e.g.: 
              https://mitpress.mit.edu/sicp/full-text/book/book.html
                                  is split into
              https://mitpress.mit.edu/sicp/full-text/book/ & book.html *)
    match Regex.Split(url, @"(?<=/)(?=[^/]+$)") with
    | [| baseUrl; filename |] -> baseUrl, filename
    | _ -> failwith ("failed to split url: " + url)


let updateReference html =
     (* Matches the filename in an image or stylesheet reference.
                            follows              match       
                          <--------->  <--------------------->  *)
    let pattern = """(?<=(href|src)=") [-\w]+\.(gif|jpg|(css)) """
                                                          
    let replace (m : Match) = 
        let dirname =               
            if m.Groups.[3].Success (* the parenthesis around (css) *)
            then "stylesheets"
            else "images" 
        dirname + "/" + m.Value

    Regex.Replace(html, pattern, replace, RegexOptions.IgnorePatternWhitespace)

let downloadedImages = new HashSet<string>()
let pullImages baseUrl text =
    (* 'imgage' group mataches text like "cover.jpg" *)
    let image = """<img src="(?<imgage>[^"]+)"""
    Regex.Matches(text, image)
    |> Seq.cast
    |> Seq.map (fun (m : Match )-> m.Groups.["imgage"].Value)
    |> Seq.filter downloadedImages.Add
    |> Seq.iter (downloadAndSave baseUrl htmlImages >> ignore)
    text

let rec pullPage baseUrl file =
    file
    |> download baseUrl
    |> toText
    |> pullImages baseUrl 
    |> updateReference
    |> saveText htmlRoot file
    |> print
    |> pullNext baseUrl

and pullNext baseUrl text =
    (* 'next' group mataches text like "book-Z-H-1.html" *)
    let next = """href="(?<next>[^"]+)">next"""
    let m = Regex.Match(text, next)
    match m.Success with
    | false -> "No Next!"
    | true -> pullPage baseUrl (m.Groups.["next"].Value)  

let page1 = @"https://mitpress.mit.edu/sicp/full-text/book/book.html"    
let baseUrl, filename = splitUrl page1

pullPage baseUrl filename |> printfn "%s"
downloadAndSave baseUrl htmlStylesheets "book-Z-C.css" |> ignore
