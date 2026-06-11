//
//  UL.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct UL: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<ul\(styleAttr)>\n\(body)\n</ul>"
    }

    public func listStyle(_ value: String) -> UL {
        var copy = self; copy.styles["list-style"] = value; return copy
    }

    public func padding(_ value: Int) -> UL {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
