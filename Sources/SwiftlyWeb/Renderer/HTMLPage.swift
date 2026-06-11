//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation

public enum RunMode {
    case file       // swift run
    case serve      // swift run -- --serve
}

public struct HTMLPage {
    let children: [HTMLElement]

    @discardableResult
    public init(
        output path: String = "index.html",
        @HTMLBuilder content: () -> [HTMLElement]
    ) {
        self.children = content()
        let mode = resolveRunMode()
        switch mode {
        case .file:  exportToFile(path)
        case .serve: serveLocally(path)
        }
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

    private func resolveRunMode() -> RunMode {
        let args = CommandLine.arguments
        return args.contains("serve") ? .serve : .file
    }

    // ── Opens as file:// ──────────────────────────────
    private func exportToFile(_ path: String) {
        let html = render()
        do {
            try html.write(toFile: path, atomically: true, encoding: .utf8)
            print("✅ Exported to \(path)")
            try Process.run(
                URL(fileURLWithPath: "/usr/bin/open"),
                arguments: [path]
            )
        } catch {
            print("❌ Failed: \(error)")
        }
    }

    // ── Serves via localhost:8080 ─────────────────────
    private func serveLocally(_ path: String) {
        let html = render()
        do {
            try html.write(toFile: path, atomically: true, encoding: .utf8)
            print("✅ Exported to \(path)")

            let server = Process()
            server.executableURL = URL(fileURLWithPath: "/usr/bin/python3")
            server.arguments = ["-m", "http.server", "8080"]
            server.currentDirectoryURL = URL(fileURLWithPath: path)
                .deletingLastPathComponent()
            try server.run()

            Thread.sleep(forTimeInterval: 0.5)
            try Process.run(
                URL(fileURLWithPath: "/usr/bin/open"),
                arguments: ["http://localhost:8080/index.html"]
            )

            print("🌐 Serving at http://localhost:8080 — press Ctrl+C to stop")
            server.waitUntilExit()
        } catch {
            print("❌ Failed: \(error)")
        }
    }
}
