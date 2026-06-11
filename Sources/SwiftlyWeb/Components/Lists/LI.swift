//
//  LI.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct LI: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(_ text: String) {
        self.children = [P(text)]
    }

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<li\(styleAttr)>\(body)</li>"
    }

    public func color(_ value: String) -> LI {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> LI {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }
}
