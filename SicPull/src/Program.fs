open System
open System.IO
open System.Net.Http
open System.Text
open System.Text.RegularExpressions
open System.Threading.Tasks
open System.Collections.Generic

// url -> baseUrl, filename
// e.g.: "https://mitpress.mit.edu/sicp/full-text/book/book.html"
//         -> "https://mitpress.mit.edu/sicp/full-text/book/", "book.html" 
let splitUrl url =
    match Regex.Split(url, @"(?<=/)(?=[^/]+$)") with
    | [| baseUrl; filename |] -> baseUrl, filename
    | _ -> failwith ("failed to split url: " + url)

let toText = Encoding.ASCII.GetString

let print text =     
    printfn "%s" text
    text
    
let client = new HttpClient()
let downloadAndSave baseUrl outDir file =
    let download url =
        client.GetByteArrayAsync(url:string).Result    
    let save outDir file bytes =
        File.WriteAllBytes(Path.Combine(outDir, file), bytes)
        bytes
    baseUrl + file 
    |> download
    |> save outDir file

let downloadedImages = new HashSet<string>()
let pullImages baseUrl outDir text =
    // 'img' group mataches text like "cover.jpg"
    let image = """<img src="(?<img>[^"]+)"""
    Regex.Matches(text, image)
    |> Seq.cast
    |> Seq.map (fun (m : Match )-> m.Groups.["img"].Value)
    |> Seq.filter downloadedImages.Add
    |> Seq.iter (downloadAndSave baseUrl outDir >> ignore)
    text

let rec pullPage baseUrl outDir file =
    file
    |> downloadAndSave baseUrl outDir 
    |> toText
    |> print
    |> pullImages baseUrl outDir
    |> pullNext baseUrl outDir

and pullNext baseUrl outDir text =
    // 'next' group mataches text like "book-Z-H-1.html"
    let next = """href="(?<next>[^"]+)">next"""
    let m = Regex.Match(text, next)
    match m.Success with
    | false -> "No Next!"
    | true -> pullPage baseUrl outDir (m.Groups.["next"].Value)    


[<EntryPoint>]
let main argv = 
    let page1 = @"https://mitpress.mit.edu/sicp/full-text/book/book.html"
    let outDir = __SOURCE_DIRECTORY__ + @"\..\book-html"
    Directory.CreateDirectory(outDir) |> ignore

    let baseUrl, filename = splitUrl page1
    pullPage baseUrl outDir filename |> printfn "%s"
    downloadAndSave baseUrl outDir "book-Z-C.css" |> ignore
    Console.ReadKey() |> ignore
    0
