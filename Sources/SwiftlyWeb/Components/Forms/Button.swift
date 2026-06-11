//
//  Button.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Button: HTMLElement {
    let text: String
    var styles: [String: String] = [:]
    var type: String = "button"
    var disabled: Bool = false
    var name: String = ""
    var value: String = ""
    var form: String = ""
    var ariaLabel: String = ""
    var onClick: String = ""        // JS onclick handler

    public init(_ text: String) { self.text = text }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        var attrs = ""
        attrs += " type=\"\(type)\""
        if disabled        { attrs += " disabled" }
        if !name.isEmpty   { attrs += " name=\"\(name)\"" }
        if !value.isEmpty  { attrs += " value=\"\(value)\"" }
        if !form.isEmpty   { attrs += " form=\"\(form)\"" }
        if !ariaLabel.isEmpty { attrs += " aria-label=\"\(ariaLabel)\"" }
        if !onClick.isEmpty   { attrs += " onclick=\"\(onClick)\"" }
        return "<button\(attrs)\(styleAttr)>\(text)</button>"
    }

    // ── Type ──────────────────────────────
    public func type(_ value: String) -> Button {
        var copy = self; copy.type = value; return copy
    }

    public func submit() -> Button { type("submit") }
    public func reset() -> Button  { type("reset") }

    // ── State ─────────────────────────────
    public func disabled(_ value: Bool = true) -> Button {
        var copy = self; copy.disabled = value; return copy
    }

    // ── Identity ──────────────────────────
    public func name(_ value: String) -> Button {
        var copy = self; copy.name = value; return copy
    }

    public func value(_ value: String) -> Button {
        var copy = self; copy.value = value; return copy
    }

    public func form(_ value: String) -> Button {
        var copy = self; copy.form = value; return copy
    }

    // ── Accessibility ─────────────────────
    public func ariaLabel(_ value: String) -> Button {
        var copy = self; copy.ariaLabel = value; return copy
    }

    // ── JS Action ─────────────────────────
    public func onClick(_ js: String) -> Button {
        var copy = self; copy.onClick = js; return copy
    }

    // ── Styles ────────────────────────────
    public func backgroundColor(_ value: String) -> Button {
        var copy = self; copy.styles["background-color"] = value; return copy
    }

    public func color(_ value: String) -> Button {
        var copy = self; copy.styles["color"] = value; return copy
    }

    public func padding(_ value: Int) -> Button {
        var copy = self; copy.styles["padding"] = "\(value)px"; return copy
    }

    public func paddingH(_ h: Int, _ v: Int) -> Button {
        var copy = self; copy.styles["padding"] = "\(v)px \(h)px"; return copy
    }

    public func borderRadius(_ value: Int) -> Button {
        var copy = self; copy.styles["border-radius"] = "\(value)px"; return copy
    }

    public func border(_ value: String) -> Button {
        var copy = self; copy.styles["border"] = value; return copy
    }

    public func cursor(_ value: String) -> Button {
        var copy = self; copy.styles["cursor"] = value; return copy
    }

    public func fontSize(_ value: Int) -> Button {
        var copy = self; copy.styles["font-size"] = "\(value)px"; return copy
    }

    public func fontWeight(_ value: String) -> Button {
        var copy = self; copy.styles["font-weight"] = value; return copy
    }

    public func width(_ value: Int) -> Button {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func opacity(_ value: Double) -> Button {
        var copy = self; copy.styles["opacity"] = "\(value)"; return copy
    }
}
