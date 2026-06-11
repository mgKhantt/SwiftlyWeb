import Foundation

public struct HTMLPage {
    let children: [HTMLElement]

    // ── For CLI usage — auto exports on init ──
    @discardableResult
    public init(
        output path: String = "index.html",
        @HTMLBuilder content: () -> [HTMLElement]
    ) {
        self.children = content()
        #if os(macOS)
        let mode = resolveRunMode()
        switch mode {
        case .file:  exportToFile(path)
        case .serve: serveLocally(path)
        }
        #endif
    }

    // ── For app usage — just build the tree ──
    // Use a different label to remove ambiguity
    public init(
        preview: Bool,
        @HTMLBuilder content: () -> [HTMLElement]
    ) {
        self.children = content()
    }

    public static func build(
        @HTMLBuilder content: () -> [HTMLElement]
    ) -> HTMLPage {
        HTMLPage(preview: true, content: content)
    }

    // ── render() is always public ──
    public func render() -> String {
        let body = children.map { $0.render() }.joined(separator: "\n")
        return """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>SwiftlyWeb</title>
        </head>
        <body>
            \(body)
        </body>
        </html>
        """
    }

    #if os(macOS)
    public func exportToFile(_ path: String = "index.html") {
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

    public func serveLocally(_ path: String = "index.html") {
        let html = render()
        do {
            try html.write(toFile: path, atomically: true, encoding: .utf8)
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
            print("🌐 Serving at http://localhost:8080")
            server.waitUntilExit()
        } catch {
            print("❌ Failed: \(error)")
        }
    }

    private func resolveRunMode() -> RunMode {
        CommandLine.arguments.contains("serve") ? .serve : .file
    }
    #endif
}

public enum RunMode {
    case file
    case serve
}
