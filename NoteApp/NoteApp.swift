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
    var notes: [Note] = testNotes
}

struct Note: Identifiable {
    var id = UUID()
    
    var title: String
    var noteText: String = ""
}


var testFolders = [
    Folder (name: "Folder1"),
    Folder (name: "Folder2")


]

var testNotes = [
    Note(title: "Notes1"),
    Note(title: "Notes2")
]
