//
//  ContentView.swift
//  NoteApp
//
//  Created by Batınay Ünsel on 27.10.2021.
//

import SwiftUI

struct ContentView: View {
    var folders = ["Folder1", "Folder2"]
    @State var searchString = ""
    @State var newFolderName = ""
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    TextField("Search", text: $searchString)
                        Section(header:
                        Text("On my iPad")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)) {
                        ForEach(folders,id: \.self) { folderName in
                            FolderCell(name: folderName)
                                
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
                        Image(systemName: "folder.bage.plus")
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(Color(.systemGray4))
                    .frame(width: 200, height: 200, alignment: .center)
                VStack {
                    Text("New Folder")
                        .font(.headline)
                    Text("Enter a name for this folder")
                        .font(.subheadline)
                    Spacer()
                    TextField("Name", text: $newFolderName)
                        .frame(width: 200, height: 10)
                        .background(Color(.white))
                        .padding()
                        .cornerRadius(7)
                    Spacer()
                    Color.gray.frame(width: 200, height: CGFloat(1))
                    HStack{
                        Button("Cancel") {
                            print("Cancel")
                        }
                        Button("Save"){
                            print("Save")
                        }
                    }
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad (8th generation)")
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
