//
//  ContentView.swift
//  DavesPortfolioApp
//
//  Created by Tashnik on 10/28/20.
//

import SwiftUI

struct ContentView: View {
  
  @SceneStorage("selectedView") var selectedView: String?
  
    var body: some View {
      TabView(selection: $selectedView) {
        HomeView()
          .tag(HomeView.tag)
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        ProjectsView(showClosedProjects: false)
          .tag(ProjectsView.openTag)
          .tabItem {
            Image(systemName: "list.bullet")
            Text("On Track")
          }
        
        ProjectsView(showClosedProjects: true)
          .tag(ProjectsView.closedTag)
          .tabItem {
            Image(systemName: "checkmark")
            Text("Completed")
          }
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var dataController = DataController.preview
  
    static var previews: some View {
        ContentView()
          .environment(\.managedObjectContext, dataController.container.viewContext)
          .environmentObject(dataController)
    }
}
