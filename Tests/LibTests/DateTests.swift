//
//  DateTests.swift
//  Lib
//
//  Created by John on 11/29/19.
//  Copyright © 2019 Expression Software. All rights reserved.
//

import XCTest
@testable import Lib

final
class DateTests: XCTestCase {
    
    lazy
    var date = Date(timeIntervalSince1970: timeInterval)
    let timeInterval = 1575150335.984297
    
    func testAllFormats() {
        XCTAssertEqual(date.format(),                     "11-30-2019"              )
        XCTAssertEqual(date.formatDateTime(),             "11-30-2019 13:45:35"     )
        XCTAssertEqual(date.formatDateTimeMilliseconds(), "11-30-2019 13:45:35.984" )
        XCTAssertEqual(date.formatHourMinute(),                       "1:45 PM"     )
        XCTAssertEqual(date.formatHourMinuteSecond(),                 "1:45:35 PM"  )
    }
    
    func testMillisecondsSince1970() {
        XCTAssertEqual(date.millisecondsSince1970, 1575150335984)
    }
    
    func testTimeInterval() {
        XCTAssertEqual(date.timeIntervalSince1970, timeInterval)
    }
    
        
    func testCurrentDate() {
        
        let date = Date()
        
        print(date.format())                      // 11-29-2019                 11-30-2019                 12-01-2019
        print(date.formatDateTime())              // 11-29-2019 23:56:16        11-30-2019 00:00:11        12-01-2019 02:00:13
        print(date.formatDateTimeMilliseconds())  // 11-29-2019 23:56:16.876    11-30-2019 00:00:11.030    12-01-2019 02:00:13.720
        print(date.formatHourMinute())            //            11:56 PM                   12:00 AM                    2:00 AM
        print(date.formatHourMinuteSecond())      //            11:56:16 PM                12:00:11 AM                 2:00:13 AM
        
        print(date.timeIntervalSince1970)         // 1575100576.876338          1575100811.029735          1575194413.72002
        print(date.millisecondsSince1970)         // 1575100576876              1575100811030              1575194413720
    }
    
}
