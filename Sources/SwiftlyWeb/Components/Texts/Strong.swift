//
//  Strong.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Strong: HTMLElement {
    let text: String
    var styles: [String: String] = [:]

    public init(_ text: String) { self.text = text }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<strong\(styleAttr)>\(text)</strong>"
    }

    public func color(_ value: String) -> Strong {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Strong {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }
}
