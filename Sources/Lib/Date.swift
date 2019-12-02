//
//  Date.swift
//  Lib
//
//  Created by John on 10/02/16.
//  Copyright © 2016 Expression Software. All rights reserved.
//

import Foundation

extension Date {
    
    public
    func format() -> String {
        return dateFormatter.string(from: self)
    }
    
    public
    func formatDateTime() -> String {
        return dateTimeFormatter.string(from: self)
    }
    
    public
    func formatDateTimeMilliseconds() -> String {
        return dateTimeMillisecondsFormatter.string(from: self)
    }
    
    
    public
    func formatHourMinute() -> String {
        return hourMinuteFormatter.string(from: self)
    }
    
    public
    func formatHourMinuteSecond() -> String {
        return hourMinuteSecondFormatter.string(from: self)
    }
    
}


extension Date {
    
    // https://stackoverflow.com/questions/40134323/date-to-milliseconds-and-back-to-date-in-swift/40135172
    // 
    public
    var millisecondsSince1970: Int64 {
        
        return Int64((timeIntervalSince1970 * 1000).rounded())
        
    }
    
}


private
let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    
    return dateFormatter
}()

private
let dateTimeFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
    
    return dateFormatter
}()

private
let dateTimeMillisecondsFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss.SSS"
    
    return dateFormatter
}()


private
let hourMinuteFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"
    
    return dateFormatter
}()

private
let hourMinuteSecondFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm:ss a"
    
    return dateFormatter
}()
