//
//  IFrame.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct IFrame: HTMLElement {
    let src: String
    var styles: [String: String] = [:]

    public init(src: String) { self.src = src }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        return "<iframe src=\"\(src)\"\(styleAttr)></iframe>"
    }

    public func width(_ value: Int) -> IFrame {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func height(_ value: Int) -> IFrame {
        var copy = self; copy.styles["height"] = "\(value)px"; return copy
    }

    public func borderRadius(_ value: Int) -> IFrame {
        var copy = self; copy.styles["border-radius"] = "\(value)px"; return copy
    }
}
