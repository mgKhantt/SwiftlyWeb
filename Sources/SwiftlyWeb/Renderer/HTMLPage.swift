//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public struct HTMLPage {
    let children: [HTMLElement]
    
    public init(@HTMLBuilder content: () -> [HTMLElement]) {
        self.children = content()
    }
    
    public func render() -> String {
        let body = children.map { $0.render() }.joined(separator: "\n")
        return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>SwiftWeb</title>
        </head>
        <body>
            \(body)
        </body>
        </html>
        """
    }
    
    public func exportToFile(_ path: String = "index.html") {
        let html = render()
        do {
            try html.write(toFile: path, atomically: true, encoding: .utf8)
            print("✅ Exported to \(path)")
            
            // Auto open in browser
            try Process.run(URL(fileURLWithPath: "/usr/bin/open"), arguments: [path])
        } catch {
            print("❌ Failed: \(error)")
        }
    }
}
