//
//  Input.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Input: HTMLElement {
    let type: String
    var placeholder: String = ""
    var name: String = ""
    var id: String = ""
    var autocomplete: String = ""
    var styles: [String: String] = [:]

    public init(type: String = "text", placeholder: String = "", name: String = "", id: String = "") {
        self.type = type
        self.placeholder = placeholder
        self.name = name
        self.id = id.isEmpty ? name : id  // default id = name
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        var attrs = " type=\"\(type)\""
        if !id.isEmpty          { attrs += " id=\"\(id)\"" }
        if !name.isEmpty        { attrs += " name=\"\(name)\"" }
        if !placeholder.isEmpty { attrs += " placeholder=\"\(placeholder)\"" }
        if !autocomplete.isEmpty { attrs += " autocomplete=\"\(autocomplete)\"" }
        return "<input\(attrs)\(styleAttr)>"
    }

    public func autocomplete(_ value: String) -> Input {
        var copy = self; copy.autocomplete = value; return copy
    }

    public func width(_ value: Int) -> Input {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func padding(_ value: Int) -> Input {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func borderRadius(_ value: Int) -> Input {
        var copy = self; copy.styles["border-radius"] = "\(value)px"; return copy
    }
}
