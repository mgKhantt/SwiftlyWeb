//
//  OL.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct OL: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<ol\(styleAttr)>\n\(body)\n</ol>"
    }

    public func listStyle(_ value: String) -> OL {
        var copy = self; copy.styles["list-style"] = value; return copy
    }

    public func padding(_ value: Int) -> OL {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
