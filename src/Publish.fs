module Publish

open System.IO
open System.Text.RegularExpressions

open Exercises
open Common

let write dir filename text =    
    let path = Path.Combine(dir, filename)
    File.WriteAllText(path, text)

let concat = String.concat NL

let wrapFileB exId text =
    [
        """#lang racket""";
        """(require "../utils.scm")""";
        """(require "../meta.scm")""";
        "";
        sprintf """(title "Exercise %s")""" exId;
        "";
        text;
    ] |> concat


let wrapFileJRkt title text =
    let title =
        match title with
        | None -> ""
        | Some title -> concat [""; title; "";] 
    [
        """#lang racket""";
        title;
        """(require "common.rkt")""";
        "";
        text;
    ] |> concat

let wrapFileJSicp title text =
    let title =
        match title with
        | None -> ""
        | Some title -> concat [""; title; "";] 
    [
        """#lang sicp""";
        title;
        """(#%require "common.scm")""";
        "";
        text;
    ] |> concat

let wrapExerciseJ exId text =
        [
            text
            ""; 
            sprintf """(-start- "%s")""" exId;
            ""; ""; "";
            sprintf """(--end-- "%s")""" exId;
            ""; ""; 
        ]        
        |> concat


let publish exercises = 
    let padExId id = Regex.Replace((id : string), "(?<=\.)\d$", (fun m -> "0" + m.Value))

    exercises |> List.iter (fun ex ->  
        let filename = sprintf "exercise-%s.txt" (padExId ex.Id)
        write exMinimum filename ex.ExMinimum)

    exercises |> List.iter (fun ex ->  
        let filename = sprintf "exercise-%s.txt" (padExId ex.Id)
        write exStandard filename ex.ExStandard)

    exercises |> List.iter (fun ex ->  
        let filename = sprintf "exercise-%s.txt" (padExId ex.Id)
        write exStandard filename ex.ExStandard)

    exercises |> List.iter (fun ex ->  
        let exId = padExId ex.Id
        let filename = sprintf "exercise-%s.scm" (padExId ex.Id)
        let text = wrapFileB exId ex.ExStandard
        write exStyleB filename text)

    exercises |> List.iter (fun ex ->  
        let filename = sprintf "exercise-%s.rkt" (padExId ex.Id)
        let title = None //Some ("; Exercise " + ex.Id)
        let content = wrapExerciseJ ex.Id ex.ExStandard
        let text = wrapFileJRkt title content
        write exStyleJRkt filename text)

    exercises |> List.iter (fun ex ->  
        let filename = sprintf "exercise-%s.scm" (padExId ex.Id)
        let title = None //Some ("; Exercise " + ex.Id)
        let content = wrapExerciseJ ex.Id ex.ExStandard
        let text = wrapFileJSicp title content
        write exStyleJSicp filename text)

    exercises
        |> List.groupBy (fun ex -> ex.TextId)
        |> List.iter(fun (sectId, sectExercises) ->
            let firstEx = sectExercises.Head
            let sectPad id = Regex.Replace(id, @"^\d\.\d$", (fun (m : Match) -> m.Value + ".0"))
            let exTrim id = Regex.Match(id, @"\d+$").Value
            let exRange = 
                sprintf "%s-%s" 
                    (firstEx.Id |> padExId |> exTrim) 
                    ((sectExercises |> Seq.last).Id |> padExId |> exTrim)
            let filename = sprintf "section%s-ex%s.rkt" (sectPad sectId) exRange
            let title = Some (sprintf "; Section %s: %s" sectId firstEx.TextTitle)
            let content = 
                sectExercises
                |> List.map (fun ex -> wrapExerciseJ ex.Id ex.ExStandard)
                |> String.concat (commentPrefix + doubleLine + NL + commentPrefix + NL)
            let text = wrapFileJRkt title content
            write exStyleJSect filename text )
