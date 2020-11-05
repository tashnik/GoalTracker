//
//  EditProjectView.swift
//  DavesPortfolioApp
//
//  Created by Tashnik on 11/5/20.
//

import SwiftUI

struct EditProjectView: View {
  
  let project: Project
  
  @EnvironmentObject var dataController: DataController
  @Environment(\.presentationMode) var presentationMode
  
  @State private var title: String
  @State private var detail: String
  @State private var color: String
  @State private var showingDeleteConfirm = false
  
  let colorColumns = [GridItem(.adaptive(minimum: 44))]
  
  init(project: Project) {
    
    self.project = project
    
    _title = State(wrappedValue: project.projectTitle)
    _detail = State(wrappedValue: project.projectDetail)
    _color = State(wrappedValue: project.projectColor)
  }
  
  var body: some View {
    
    Form {
      Section(header: Text("Basic Settings")) {
        TextField("Goal Name", text: $title.onChange(update))
        TextField("Description of this Goal", text: $detail.onChange(update))
      }
      
      Section (header: Text("Custom Goal Color")) {
        LazyVGrid(columns: colorColumns) {
          ForEach(Project.colors, id: \.self) { item in
            ZStack {
              Color(item)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(6)
              
              if item == color {
                Image(systemName: "checkmark.circle")
                  .foregroundColor(.white)
                  .font(.largeTitle)
              }
            }
            .onTapGesture {
              color = item
              update()
            }
          }
        }
        .padding(.vertical)
      }
      
      Section(footer: Text("Completed this goal.  Completing moves the goal to the Completed tab.  Deleting it removes it entirely")) {
        Button(project.closed ? "Reopen this Goal" : "Mark goal as completed") {
          project.closed.toggle()
          update()
        }
        
        Button ("Delete this goal") {
          showingDeleteConfirm.toggle()
            
        }
        .accentColor(.red)
      }
      
    }
    .navigationTitle("Edit Goal")
    .onDisappear(perform: {
      dataController.save()
    })
    .alert(isPresented: $showingDeleteConfirm, content: {
      Alert(title: Text("Delete Goal?"), message: Text("Are you sure you want to delete this goal?  This will also delete all your actions it contains"), primaryButton: .default(Text("Delete")), secondaryButton: .cancel())
    })
  }
  
  func update() {
    project.title = title
    project.detail = detail
    project.color = color
  }
  
  func delete() {
    dataController.delete(project)
    presentationMode.wrappedValue.dismiss()
  }
}

struct EditProjectView_Previews: PreviewProvider {
  static var previews: some View {
    EditProjectView(project: Project.example)
  }
}