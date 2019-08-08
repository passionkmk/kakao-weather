//
//  Log.swift
//  kakao-weather
//
//  Created by we on 08/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

public func d(_ log: Any!, prefix: String = "DEBUG", file: String = #file, line: Int = #line, function: String = #function) {
    let string: String = debugString(log, prefix: prefix, file: file, line: line, function: function)
    print(string)
}

func debugString(_ log: Any!, prefix: String = "LOG", file: String = #file, line: Int = #line, function: String = #function) -> String {
    let lastFile: String = (file as NSString).lastPathComponent
    return "\n[\(prefix):] \(function) in \(lastFile)(\(line))\n" + "\(log ??? "nil")" + "\n[:\(prefix)] \(function) in \(lastFile)(\(line))\n"
}

infix operator ???: NilCoalescingPrecedence
public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
    return optional.map { String(describing: $0) } ?? defaultValue()
}
