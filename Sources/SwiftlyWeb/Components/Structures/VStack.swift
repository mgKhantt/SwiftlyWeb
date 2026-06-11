//
//  VStack.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct VStack: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]
    var gap: Int = 8

    public init(gap: Int = 8, @HTMLBuilder content: () -> [HTMLElement]) {
        self.gap = gap
        self.children = content()
    }

    public func render() -> String {
        var baseStyles: [String: String] = [
            "display": "flex",
            "flex-direction": "column",
            "gap": "\(gap)px"
        ]
        baseStyles.merge(styles) { _, new in new }

        let styleAttr = " style=\"\(baseStyles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<div\(styleAttr)>\n\(body)\n</div>"
    }

    public func alignItems(_ value: String) -> VStack {
        var copy = self; copy.styles["align-items"] = value; return copy
    }

    public func padding(_ value: Int) -> VStack {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
