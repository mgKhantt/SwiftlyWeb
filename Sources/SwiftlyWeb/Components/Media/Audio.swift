//
//  Audio.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Audio: HTMLElement {
    let src: String
    var controls: Bool = true

    public init(src: String, controls: Bool = true) {
        self.src = src
        self.controls = controls
    }

    public func render() -> String {
        let controlsAttr = controls ? " controls" : ""
        return "<audio src=\"\(src)\"\(controlsAttr)></audio>"
    }
}
