//
//  File.swift
//  Lib
//
//  Created by John on 01/10/16.
//  Copyright © 2016 Expression Software. All rights reserved.
//

import Foundation

// Read and print file with line numbers and lines matching regex

// MARK: Read File
// 

func readFile(_ filename: String) -> String? {
    
    guard let data: Data = FileManager().contents(atPath: filename)
              else {
                  print("Error reading file: \"\(filename)\"")
                  return nil
              }
    
    
    let content: String? = String(data: data, encoding: String.Encoding.utf8)
    
    return content
}


func readLinesFromFile(_ filename: String) -> Array<String>? {
    
    readLinesFromFile(filename: filename,
                      maxSplits: Int.max,
                      skipEmptyLines: false)
}

func readLinesFromFile(filename: String,
                       maxSplits: Int = Int.max,
                       skipEmptyLines: Bool = false) -> Array<String>? {
    
    guard let content: String = readFile(filename)
              else { return nil }
    
    
    return content.split(separator: "\n",
                         maxSplits: maxSplits,
                         omittingEmptySubsequences: skipEmptyLines)
                  .map(String.init)
}


// MARK: Print File
// 

func printFile(_ filename: String,
               _ lines: Array<String>,
               _ printLines: Set<Int>,
               _ printLineClosure: (String, String) -> Void) {
    
    let paddingLength: Int = String(lines.count).count + 1
    
    
    print("File: \(filename)\n\n")
    
    for (index, line) in lines.enumerated() {
        
        var lineNum = String(format: "%d.", index + 1)
        
        lineNum = lineNum.padding(toLength: paddingLength, withPad: " ", startingAt: 0)
        
        if printLines.contains(index) {
            printLine(lineNum, line)
        }
        else {
            printLineClosure(lineNum, line)
        }
    }
    
}


func printLine(_ lineNum: String, _ line: String) {
    
    print("\(lineNum) \(line)")
}
