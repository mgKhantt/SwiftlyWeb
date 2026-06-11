//
//  Heading.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Heading: HTMLElement {
    
    let level: Int
    let text: String
    var styles: [String: String] = [:]
    
    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<h\(level)\(styleAttr)>\(text)</h\(level)>"
    }
    
    public func color(_ value: String) -> Heading {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Heading {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }

    public func fontWeight(_ value: String) -> Heading {
        var copy = self; copy.styles["font-weight"] = value; return copy
    }
}
