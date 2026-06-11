//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Form: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]
    var id: String = ""

    public init(id: String = "", @HTMLBuilder content: () -> [HTMLElement]) {
        self.id = id
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let idAttr = id.isEmpty ? "" : " id=\"\(id)\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<form\(idAttr)\(styleAttr)>\n\(body)\n</form>"
    }

    public func padding(_ value: Int) -> Form {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
