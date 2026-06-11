//
//  Img.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Img: HTMLElement {
    let src: String
    let alt: String
    var styles: [String: String] = [:]

    public init(src: String, alt: String = "") {
        self.src = src
        self.alt = alt
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<img src=\"\(src)\" alt=\"\(alt)\"\(styleAttr)>"
    }

    public func width(_ value: Int) -> Img {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func height(_ value: Int) -> Img {
        var copy = self; copy.styles["height"] = "\(value)px"; return copy
    }

    public func borderRadius(_ value: Int) -> Img {
        var copy = self; copy.styles["border-radius"] = "\(value)px"; return copy
    }

    public func objectFit(_ value: String) -> Img {
        var copy = self; copy.styles["object-fit"] = value; return copy
    }
}
