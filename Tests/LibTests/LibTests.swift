//
//  LibTests.swift
//  Lib
//
//  Created by John on 11/29/19.
//  Copyright © 2019 Expression Software. All rights reserved.
//

import XCTest
@testable import Lib

final
class LibTests: XCTestCase {
    
    func testText() {
        
        XCTAssertEqual(Lib().text, "Hello Swift Package Manager!")
        
    }
    
    
    func testWriteStringArrayToFile() {
        
        let file = "/tmp/tempStringArrayData.txt"
        
        let data: Array<String> = ["foo", "bar"]
        let fileData: String = data.joined(separator: "\n")
        
        do {
            
            try fileData.write(toFile: file,
                               atomically: true,
                               encoding: String.Encoding.utf8)
            
        }
        catch {
            print(error)
        }
        
    }
    
}
