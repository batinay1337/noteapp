//
//  NoteApp.swift
//  NoteApp
//
//  Created by Batınay Ünsel on 31.10.2021.
//

import Foundation

class NoteApp: ObservableObject {
    @Published var folders = [Folder] ()
}


struct Folder: Identifiable {
    var id = UUID()
    var name: String
}

var testFolders = [
    Folder (name: "Folder1"),
    Folder (name: "Folder2")


]
