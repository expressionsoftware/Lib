//
//  FileTests.swift
//  Lib
//
//  Created by John on 01/10/16.
//  Copyright © 2016 Expression Software. All rights reserved.
//

import XCTest
@testable import Lib

class FileTests: XCTestCase {
    
    let file = "/users/john/temp.txt"
    
    func testFileExists() {
        
        XCTAssertTrue(FileManager.default.fileExists(atPath: file))
    }
    
}


// MARK: Read File
// 

extension FileTests {
    
    func testReadFile() {
        
        guard let lines: Array<String> = readLinesFromFile(file)
                  else { XCTFail(); return }
        
        
        XCTAssertGreaterThan(lines.count, 0)
    }
    
    func testReadFileFail() {
        
        XCTAssertNil(readLinesFromFile(""))
    }
    
    
    func testPrintFile() {
        
        guard let lines: Array<String> = readLinesFromFile(file)
                  else { XCTFail(); return }
        
        
        printFile(file, lines, [], printLine)
    }
    
}


// MARK: Print File Regex Match

extension FileTests {
    
    func testPrintFileRegexMatch(_ pattern: String,
                                 _ printLineClosure: (String, String, NSTextCheckingResult) -> Void) {
        
        guard let lines: Array<String> = readLinesFromFile(file)
                  else { XCTFail(); return }
        
        
        let regex = try! NSRegularExpression(pattern: pattern,
                                             options: [NSRegularExpression.Options.caseInsensitive])
        
        var matchCount = 0
        
        
        printFile(file,
                  lines,
                  [0]) { (lineNum: String, line: String) -> Void in
            
            
            let lineRange = NSMakeRange(0, line.count)
            
            guard let match: NSTextCheckingResult = regex.firstMatch(in: line, options: [], range: lineRange)
                      else { return }
            
            
            if match.range.length > 0 {
                matchCount += 1
                
                printLineClosure(lineNum, line, match)
            }
            
            
        }  // printFile()
        
        
        print("\n\(matchCount) matches found")
        print("Regex Pattern: \"\(pattern)\"\n\n.")
    }
    
    
    // Print Full Line, use when regex matches full line, see pattern
    // 
    func testPrintFileRegexMatchPrintFullLine() {
        
        let pattern = #".*[a-f0-9]{40}\b.*"#  // sha1 hash
        
        
        testPrintFileRegexMatch(pattern) { (lineNum: String, line: String, _: NSTextCheckingResult) in 
            
            printLine(lineNum, line)
            
        }
        
    }
    
    
    // Print Substring
    // 
    func testPrintFileRegexMatchPrintSubstring() {
        
        let pattern = #"[a-f0-9]{40}\b"#  // sha1 hash
        
        
        testPrintFileRegexMatch(pattern) { (lineNum: String, line: String, match: NSTextCheckingResult) in
            
            let matchStartIndex: String.Index         = line.index(line.startIndex, offsetBy: match.range.location)
            let matchEndIndex:   String.Index         = line.index(matchStartIndex, offsetBy: match.range.length)
            let range:           Range<String.Index>  = Range(uncheckedBounds: (lower: matchStartIndex, upper: matchEndIndex))
            
            let substring:       Substring            = line[range]
            
            return printLine(lineNum, String(substring))
            
        }
        
    }
    
}
