//
//  TextArea.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct TextArea: HTMLElement {
    var placeholder: String = ""
    var name: String = ""
    var rows: Int = 4
    var styles: [String: String] = [:]

    public init(placeholder: String = "", name: String = "", rows: Int = 4) {
        self.placeholder = placeholder
        self.name = name
        self.rows = rows
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<textarea placeholder=\"\(placeholder)\" name=\"\(name)\" rows=\"\(rows)\"\(styleAttr)></textarea>"
    }

    public func width(_ value: Int) -> TextArea {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func padding(_ value: Int) -> TextArea {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
