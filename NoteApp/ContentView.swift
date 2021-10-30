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
                        Text("On my device")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)) {
                            ForEach(noteApp.folders) { folder in
                                FolderCell(name: folder.name)
                                
                        }
                    }
                    .textCase(nil)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Folders")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button("Edit"){
                            print("Edit")
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar){
                        Image(systemName: "folder.badge.plus")
                            .onTapGesture(perform: {
                                showingPopover.toggle()
                            })
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            if showingPopover {
                NewFolderView()
            }
        }
    }
}

struct FolderCell: View {
    var name: String
    var body: some View {
        HStack{
            Image(systemName: "folder")
            Text(name)
        }
    }
}

struct NewFolderView: View {
    @State var newFolderName = ""
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
                        Button(action: {print("Save")}) {
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
