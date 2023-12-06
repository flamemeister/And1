//
//  AndOneApp.swift
//  AndOne
//
//  Created by Aldiyar Saken on 01.12.2023.
//

import SwiftUI
import Firebase

@main
struct AndOneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                WelcomeView()
            }
        }
    }
}
