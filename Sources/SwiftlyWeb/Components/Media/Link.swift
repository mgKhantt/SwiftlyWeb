//
//  Link.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Link: HTMLElement {
    let text: String
    let href: String
    var styles: [String: String] = [:]
    var openInNewTab: Bool = false

    public init(_ text: String, href: String) {
        self.text = text
        self.href = href
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let target = openInNewTab ? " target=\"_blank\"" : ""
        return "<a href=\"\(href)\"\(target)\(styleAttr)>\(text)</a>"
    }

    public func color(_ value: String) -> Link {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Link {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }

    public func newTab() -> Link {
        var copy = self; copy.openInNewTab = true; return copy
    }
}
