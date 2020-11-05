//
//  ProjectHeaderView.swift
//  DavesPortfolioApp
//
//  Created by Tashnik on 11/5/20.
//

import SwiftUI

struct ProjectHeaderView: View {
  
  @ObservedObject var project: Project
  
  var body: some View {
    HStack {
      
      VStack(alignment: .leading) {
        Text(project.projectTitle)
          .font(.headline)
        
        ProgressView(value: project.completionAmount)
          .accentColor(Color(project.projectColor))
      }
      
      Spacer()
      
      NavigationLink(destination: EditProjectView(project: project)) {
       Image(systemName: "square.and.pencil")
        .imageScale(.large)
      }
    }
    .padding(.bottom, 10)
  }
}

struct ProjectHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectHeaderView(project: Project.example)
  }
}
