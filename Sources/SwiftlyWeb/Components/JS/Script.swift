//
//  Script.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct Script: HTMLElement {
    let code: String

    public init(_ code: String) { self.code = code }

    public func render() -> String {
        return "<script>\n\(code)\n</script>"
    }
}
