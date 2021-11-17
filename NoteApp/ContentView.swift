//
//  ContentView.swift
//  NoteApp
//
//  Created by Batınay Ünsel on 27.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var noteApp: NoteApp
    @State var searchString = ""
    @State var newFolderName = ""
    @State var showingPopover = false
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    TextField("Search", text: $searchString)
                        Section(header:
                        Text("On My Device")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)) {
                            if noteApp.folders.count > 0 {
                                FolderCell(name: "All on My Device")
                            }
                            FolderCell(name: "Notes")
                            ForEach(noteApp.folders) { folder in
                                FolderCell(name: folder.name)
                        }
                            .onDelete(perform: { indexSet in
                                noteApp.folders.remove(atOffsets: indexSet)
                            })
                    }
                    .textCase(nil)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Folders")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        EditButton()
                    }
                    ToolbarItemGroup(placement: .bottomBar){
                        Image(systemName: "folder.badge.plus")
                            .onTapGesture {
                                showingPopover.toggle()
                            }
                        Spacer()
                        NavigationLink(destination: NoteView()) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
            if showingPopover {
                CreateNewFolder($showingPopover, with: noteApp)
            }
        }
    }
}

struct FolderCell: View {
    var name: String
    var body: some View {
        NavigationLink(destination: FolderView(folderName: name)) {
            HStack{
                Image(systemName: "folder")
                Text(name)
            }
        }
    }
}

struct CreateNewFolder: View {
    @ObservedObject var noteApp: NoteApp
    @Binding var showingPopover: Bool
    
    @State var newFolderName = ""
    
    init(_ showingPopover: Binding<Bool>, with noteApp: NoteApp){
        self._showingPopover = showingPopover
        self.noteApp = noteApp
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray4))
                    .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.40, alignment: .center)
                VStack {
                    Text("New Folder")
                        .font(.headline)
                    Text("Enter a name for this folder")
                        .font(.subheadline)
                    Spacer()
                    TextField("Name", text: $newFolderName)
                        .frame(width: 200, height: 10)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10)
                    Spacer()
                    Color.gray.frame(width: 200, height: CGFloat(1))
                    HStack{
                        Button(action: {print("Cancel")}) {
                            Text("Cancel")
                                .frame(maxWidth: .infinity)
                        }
                        Button(action: {
                            noteApp.folders.append(Folder(name: newFolderName))
                            showingPopover.toggle()
                        }) {
                            Text("Save")
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .frame(width: geo.size.width * 0.70, height: geo.size.width * 0.35)
            }
            .frame(width: geo.size.width, height: geo.size.height,alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let testNotes = NoteApp()
        testNotes.folders = testFolders
        return ContentView(noteApp: testNotes)
    }
}
