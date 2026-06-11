//
//  HTMLElement.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public protocol HTMLElement {
    func render() -> String
}

@resultBuilder
public struct HTMLBuilder {
    public static func buildBlock(_ components: HTMLElement...) -> [HTMLElement] {
        components
    }
}
