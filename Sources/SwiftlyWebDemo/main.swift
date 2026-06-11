//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation
import SwiftlyWeb

let page = HTMLPage {
    VStack(gap: 16) {
        H1("SwiftlyWeb Framework")
            .color("steelblue")
            .fontSize(40)

        Div {
            P("Build web UIs with pure Swift.")
                .color("gray")
                .fontSize(18)

            Link("Visit Swift.org", href: "https://swift.org")
                .color("steelblue")
                .fontSize(16)
                .newTab()
        }
        .backgroundColor("#f5f5f5")
        .padding(20)
        .borderRadius(12)
    }
    .padding(40)
}

page.exportToFile("index.html")
