//
//  Span.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Span: HTMLElement {
    var id: String = ""
    let text: String
    var styles: [String: String] = [:]

    public init(_ text: String) { self.text = text }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let idAttr = id.isEmpty ? "" : " id=\"\(id)\""
        return "<span\(idAttr)\(styleAttr)>\(text)</span>"
    }
    
    public func id(_ value: String) -> Span {
        var copy = self; copy.id = value; return copy
    }

    public func color(_ value: String) -> Span {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Span {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }

    public func fontWeight(_ value: String) -> Span {
        var copy = self; copy.styles["font-weight"] = value; return copy
    }
}
