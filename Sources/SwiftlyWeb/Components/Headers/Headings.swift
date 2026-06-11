//
//  Headings.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct H1: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 2, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H1 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H1 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H1 { var c = self; c.heading = heading.fontWeight(value); return c }
}

public struct H2: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 2, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H2 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H2 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H2 { var c = self; c.heading = heading.fontWeight(value); return c }
}

public struct H3: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 3, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H3 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H3 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H3 { var c = self; c.heading = heading.fontWeight(value); return c }
}

public struct H4: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 4, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H4 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H4 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H4 { var c = self; c.heading = heading.fontWeight(value); return c }
}

public struct H5: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 5, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H5 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H5 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H5 { var c = self; c.heading = heading.fontWeight(value); return c }
}

public struct H6: HTMLElement {
    private var heading: Heading
    public init(_ text: String) { heading = Heading(level: 6, text: text) }
    public func render() -> String { heading.render() }
    public func color(_ value: String) -> H6 { var c = self; c.heading = heading.color(value); return c }
    public func fontSize(_ value: Int) -> H6 { var c = self; c.heading = heading.fontSize(value); return c }
    public func fontWeight(_ value: String) -> H6 { var c = self; c.heading = heading.fontWeight(value); return c }
}
