//
//  Label.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Label: HTMLElement {
    let text: String
    var forId: String = ""          // renamed: for id not name
    var styles: [String: String] = [:]

    public init(_ text: String, for inputId: String = "") {
        self.text = text
        self.forId = inputId
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let forAttr = forId.isEmpty ? "" : " for=\"\(forId)\""
        return "<label\(forAttr)\(styleAttr)>\(text)</label>"
    }

    public func color(_ value: String) -> Label {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Label {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }

    public func fontWeight(_ value: String) -> Label {
        var copy = self; copy.styles["font-weight"] = value; return copy
    }
}
