//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Batınay Ünsel on 27.10.2021.
//

import SwiftUI

@main
struct NoteAppApp: App {
    @StateObject private var noteApp = NoteApp()
    
    var body: some Scene {
        WindowGroup {
            ContentView(noteApp: noteApp)
        }
    }
}
