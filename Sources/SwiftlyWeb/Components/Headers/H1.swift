//
//  H1.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct H1: HTMLElement {
    let text: String
    var styles: [String: String] = [:]
    
    public init(_ text: String) {self.text = text}
    
    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<h1\(styleAttr)>\(text)</h1>"
    }
    
    public func color(_ value: String) -> H1 {
        var copy = self; copy.styles["color"] = value; return copy
    }
    
    public func fontSize(_ value: Int) -> H1 {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }
}
