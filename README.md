# SwiftlyWeb

A Swift DSL for building HTML pages with pure Swift syntax — no JavaScript, no HTML, just Swift.

## Requirements
- macOS 13+
- Swift 6.3+

## Installation

### Option A — Swift Package Manager (Package.swift)

```swift
dependencies: [
    .package(url: "https://github.com/mgKhantt/SwiftlyWeb.git", from: "1.0.1")
],
targets: [
    .executableTarget(
        name: "YourApp",
        dependencies: [
            .product(name: "SwiftlyWeb", package: "SwiftlyWeb")
        ]
    )
]
```

### Option B — Xcode Project MacOS (Command Line Tool)

1. `File` → `Add Package Dependencies`
2. Paste: `https://github.com/mgKhantt/SwiftlyWeb.git`
3. Click `Add Package`
---

## Generate Static HTML

SwiftlyWeb can also generate HTML files without launching a local server.

### Build and Export

```swift
import SwiftlyWeb

HTMLPage.build {
    H1("Hello World")
        .color("steelblue")
        .fontSize(40)

    P("Built with SwiftlyWeb.")
}
.exportToFile()
```

This creates an `index.html` file in the current working directory.

### Export to a Custom Location

```swift
import SwiftlyWeb

HTMLPage.build {
    H1("Hello World")
        .color("steelblue")
        .fontSize(40)

    P("Built with SwiftlyWeb.")
}
.exportToFile("/Users/khant/Desktop/website/index.html")
```

### Example Use Cases

* Generate static websites
* Create landing pages
* Export HTML for deployment
* Produce HTML reports and documents
* Build websites without running a development server

> `HTMLPage { ... }` starts a local development server and automatically opens your browser.
>
> `HTMLPage.build { ... }` generates HTML content that can be exported directly to a file.

---

## Components

### Text
```swift
H1("Title")         // <h1>
H2("Subtitle")      // <h2> ... H3, H4, H5, H6
P("Paragraph")      // <p>
Span("Inline")      // <span>
Strong("Bold")      // <strong>
Em("Italic")        // <em>
BR()                // <br>
```

### Layout
```swift
Div { }             // <div>
VStack(gap: 16) { } // <div> with flex column
HStack(gap: 16) { } // <div> with flex row
Header { }          // <header>
Nav { }             // <nav>
Main { }            // <main>
Section { }         // <section>
Article { }         // <article>
Aside { }           // <aside>
Footer { }          // <footer>
```

### Lists
```swift
UL {
    LI("Item one")
    LI("Item two")
}

OL {
    LI("First")
    LI("Second")
}
```

### Tables
```swift
Table {
    TR {
        TH("Name").backgroundColor("steelblue").color("white").padding(12)
        TH("Role").backgroundColor("steelblue").color("white").padding(12)
    }
    TR {
        TD("Khant").padding(12)
        TD("iOS Dev").padding(12)
    }
}
.bordered()
.width("100%")
```

### Forms
```swift
Form(id: "contact") {
    Label("Your Name", for: "name").fontWeight("600")
    Input(type: "text", placeholder: "Enter name", name: "name")
        .autocomplete("name")
        .width(300).padding(10).borderRadius(8)

    Button("Submit").submit().backgroundColor("steelblue").color("white")
    Button("Clear").type("button").onClick("clearForm()")
    Button("Disabled").disabled().opacity(0.4)
}
```

### Media
```swift
Img(src: "photo.jpg", alt: "Photo").width(300).borderRadius(12)
Video(src: "video.mp4").width(640).height(360)
Audio(src: "audio.mp3")
IFrame(src: "https://example.com").width(800).height(600)
Link("Visit", href: "https://swift.org").newTab().color("steelblue")
```

### JavaScript
```swift
Script("""
    function sayHello() {
        console.log('Hello from SwiftlyWeb!')
    }
""")
```

---

## Modifiers

All components support chainable modifiers:

```swift
H1("Hello")
    .color("steelblue")
    .fontSize(40)
    .fontWeight("700")

Div { }
    .backgroundColor("#f5f5f5")
    .padding(20)
    .borderRadius(12)
    .border("1px solid #ccc")
```

---

## Full Example

```swift
import SwiftlyWeb

HTMLPage {
    Header {
        Nav {
            Link("Home", href: "/").color("white")
            Link("About", href: "/about").color("white")
        }
        .display("flex").gap(16).padding(20)
    }
    .backgroundColor("steelblue")

    Main {
        H1("SwiftlyWeb").color("steelblue").fontSize(40)
        P("Build websites with pure Swift.")

        Form(id: "contact") {
            Label("Name", for: "name").fontWeight("600")
            Input(type: "text", placeholder: "Your name", name: "name")
                .autocomplete("name").width(300).padding(10).borderRadius(8)

            Button("Submit")
                .submit()
                .backgroundColor("steelblue")
                .color("white")
                .padding(12).borderRadius(8).border("none")
        }
    }
    .padding(40)

    Footer {
        P("© 2026 SwiftlyWeb").color("gray")
    }
    .textAlign("center").padding(20)
}
```

## License
MIT
