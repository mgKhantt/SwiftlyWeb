//
//  Select.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Option: HTMLElement {
    let value: String
    let label: String

    public init(_ label: String, value: String) {
        self.label = label
        self.value = value
    }

    public func render() -> String {
        return "<option value=\"\(value)\">\(label)</option>"
    }
}

public struct Select: HTMLElement {
    let children: [HTMLElement]
    var name: String = ""
    var styles: [String: String] = [:]

    public init(name: String = "", @HTMLBuilder content: () -> [HTMLElement]) {
        self.name = name
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<select name=\"\(name)\"\(styleAttr)>\n\(body)\n</select>"
    }

    public func padding(_ value: Int) -> Select {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func width(_ value: Int) -> Select {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }
}
