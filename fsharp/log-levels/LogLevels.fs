module LogLevels
open System

let message (logLine: string): string = 
  let separatorIndex = logLine.IndexOf(':')
  logLine.Substring(separatorIndex + 2).Trim()

let logLevel(logLine: string): string = 
  let startIndex = logLine.IndexOf('[')
  let endIndex = logLine.IndexOf(']')
  logLine.Substring(startIndex + 1, (endIndex - startIndex) - 1)
  |> String.map Char.ToLower


let reformat(logLine: string): string = 
  let parsedMessage = message logLine
  let parsedLevel = logLevel logLine
  $"{parsedMessage} ({parsedLevel})"
