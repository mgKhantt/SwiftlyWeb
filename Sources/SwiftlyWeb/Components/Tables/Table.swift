//
//  Table.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Table: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<table\(styleAttr)>\n\(body)\n</table>"
    }

    public func width(_ value: String) -> Table {
        var copy = self; copy.styles["width"] = value; return copy
    }

    public func borderCollapse(_ value: String) -> Table {
        var copy = self; copy.styles["border-collapse"] = value; return copy
    }
    
    public func border(_ value: String) -> Table {
        var copy = self; copy.styles["border"] = value; return copy
    }
    
    public func bordered(_ color: String = "#cccccc", width: Int = 1) -> Table {
        var copy = self
        copy.styles["border"] = "\(width)px solid \(color)"
        copy.styles["border-collapse"] = "collapse"
        return copy
    }
}

public struct TR: HTMLElement {
    let children: [HTMLElement]
    var styles: [String: String] = [:]

    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let body = children.map { $0.render() }.joined(separator: "\n")
        return "<tr\(styleAttr)>\n\(body)\n</tr>"
    }

    public func backgroundColor(_ value: String) -> TR {
        var copy = self; copy.styles["background-color"] = value; return copy
    }
    
    public func border(_ value: String) -> TR {
        var copy = self; copy.styles["border"] = value; return copy
    }
}

public struct TH: HTMLElement {
    let text: String
    var styles: [String: String] = [:]

    public init(_ text: String) { self.text = text }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<th\(styleAttr)>\(text)</th>"
    }

    public func padding(_ value: Int) -> TH {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func backgroundColor(_ value: String) -> TH {
        var copy = self; copy.styles["background-color"] = value; return copy
    }

    public func color(_ value: String) -> TH {
        var copy = self; copy.styles["color"] = value; return copy
    }
    
    public func border(_ value: String) -> TH {
        var copy = self; copy.styles["border"] = value; return copy
    }
}

public struct TD: HTMLElement {
    let text: String
    var styles: [String: String] = [:]

    public init(_ text: String) { self.text = text }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<td\(styleAttr)>\(text)</td>"
    }

    public func padding(_ value: Int) -> TD {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func color(_ value: String) -> TD {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func border(_ value: String) -> TD {
        var copy = self; copy.styles["border"] = value; return copy
    }
}
