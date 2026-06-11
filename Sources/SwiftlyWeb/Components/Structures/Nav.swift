//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Nav: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<nav\(styleAttr)>\n\(body)\n</nav>"
    }

    public func display(_ value: String) -> Nav {
        var copy = self; copy.styles["display"] = value; return copy
    }

    public func gap(_ value: Int) -> Nav {
        var copy = self; copy.styles["gap"] = "\(value)px"; return copy
    }

    public func padding(_ value: Int) -> Nav {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }
}
