open System

[<EntryPoint>]
let main argv =
    let tree = Tree.files
    printfn "Hello, World! %s"  (string tree.Length)
    Console.ReadKey() |> ignore
    0