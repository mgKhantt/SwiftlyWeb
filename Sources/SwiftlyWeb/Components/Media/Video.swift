//
//  Video.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Video: HTMLElement {
    let src: String
    var controls: Bool = true
    var styles: [String: String] = [:]

    public init(src: String, controls: Bool = true) {
        self.src = src
        self.controls = controls
    }

    public func render() -> String {
        let styleAttr = styles.isEmpty ? "" : " style=\"\(styles.map { "\($0): \($1)" }.joined(separator: "; "))\""
        let controlsAttr = controls ? " controls" : ""
        return "<video src=\"\(src)\"\(controlsAttr)\(styleAttr)></video>"
    }

    public func width(_ value: Int) -> Video {
        var copy = self; copy.styles["width"] = "\(value)px"; return copy
    }

    public func height(_ value: Int) -> Video {
        var copy = self; copy.styles["height"] = "\(value)px"; return copy
    }
}
