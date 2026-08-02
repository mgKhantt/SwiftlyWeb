//
//  File.swift
//  SwiftlyWeb
//
//  Created by Khant Phone Naing  on 11/06/2026.
//

import Foundation
import SwiftlyWeb

//HTMLPage { }
//    ↓ @HTMLBuilder collects components
//[H1, P, Div, Link]
//    ↓ render() called on each
//["<h1>...</h1>", "<p>...</p>", ...]
//    ↓ joined + wrapped in HTML boilerplate
//"<!DOCTYPE html>...<body>...</body></html>"
//    ↓ written to index.html
//Browser opens it

HTMLPage {
    Main {
        H1("SwiftlyWeb").color("steelblue")
        P("Pure Swift web framework.")

        UL {
            LI("Fast")
            LI("Native Swift")
            LI("No dependencies")
        }
        
        Link("Go to youtube", href: "www.youtube.com")

        Table {
            TR {
                TH("Name").padding(12).border("1px solid #ccc")
                TH("Role").padding(12).border("1px solid #ccc")
            }
            TR {
                TD("Khant").padding(12).border("1px solid #ccc")
                TD("iOS Dev").padding(12).border("1px solid #ccc")
            }
        }
        .borderCollapse("collapse")
        .width("100%")

        // ── Contact Form ──
        Form(id: "contact-form") {
            VStack(gap: 12) {
                Label("Your Name", for: "name").fontWeight("600")
                Input(type: "text", placeholder: "Enter your name", name: "name")
                    .autocomplete("name")
                    .width(300).padding(10).borderRadius(8)
                Span("").id("error-name").color("red").fontSize(13)

                Label("Your Email", for: "email").fontWeight("600")
                Input(type: "email", placeholder: "Enter your email", name: "email")
                    .autocomplete("email")
                    .width(300).padding(10).borderRadius(8)
                Span("").id("error-email").color("red").fontSize(13)

                Button("Submit")
                    .submit()
                    .onClick("return validateForm()")
                    .backgroundColor("steelblue")
                    .color("white")
                    .padding(12).borderRadius(8)
                    .border("none").cursor("pointer")

                Button("Clear Form")
                    .type("button")           // ← not reset, we handle it manually
                    .onClick("clearErrors()")
                    .color("steelblue")
                    .border("1px solid steelblue")
                    .backgroundColor("white")
                    .borderRadius(8).padding(10).cursor("pointer")
            }
        }
    }
    .padding(40)
    
    Script("""
        function validateForm() {
            let valid = true

            const name = document.getElementById('name')
            const nameError = document.getElementById('error-name')
            if (!name.value.trim()) {
                nameError.textContent = '⚠️ Name is required'
                name.style.borderColor = 'red'
                valid = false
            } else {
                nameError.textContent = ''
                name.style.borderColor = ''
            }

            const email = document.getElementById('email')
            const emailError = document.getElementById('error-email')
            const emailRegex = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/
            if (!email.value.trim()) {
                emailError.textContent = '⚠️ Email is required'
                email.style.borderColor = 'red'
                valid = false
            } else if (!emailRegex.test(email.value)) {
                emailError.textContent = '⚠️ Enter a valid email address'
                email.style.borderColor = 'red'
                valid = false
            } else {
                emailError.textContent = ''
                email.style.borderColor = ''
            }

            return valid
        }

        function clearErrors() {
            // Clear input values
            document.getElementById('name').value = ''
            document.getElementById('email').value = ''
            // Clear error messages
            document.getElementById('error-name').textContent = ''
            document.getElementById('error-email').textContent = ''
            // Clear border colors
            document.getElementById('name').style.borderColor = ''
            document.getElementById('email').style.borderColor = ''
        }
    """)
}
