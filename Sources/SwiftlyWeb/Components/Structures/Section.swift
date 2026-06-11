//
//  Section.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Section: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<section\(styleAttr)>\n\(body)\n</section>"
    }

    public func padding(_ value: Int) -> Section {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func backgroundColor(_ value: String) -> Section {
        var copy = self; copy.styles["background-color"] = value; return copy
    }
}
