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
          .foregroundColor(.white)
        
        ProgressView(value: project.completionAmount)
          .accentColor(Color(project.projectColor))
      }
      
      .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
      .cornerRadius(6.0)
      
      Spacer()
      
      NavigationLink(destination: EditProjectView(project: project)) {
       Image(systemName: "scribble.variable")
        .imageScale(.large)
        .foregroundColor(.blue)
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
