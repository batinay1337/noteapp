//
//  NoteView.swift
//  NoteApp
//
//  Created by Batınay Ünsel on 18.11.2021.
//

import SwiftUI

struct NoteView: View {
    @State var title = ""
    @State var noteText = ""
    
    var body: some View {
        TextEditor(text: $noteText)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
