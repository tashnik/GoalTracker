//
//  HomeView.swift
//  DavesPortfolioApp
//
//  Created by Tashnik on 10/30/20.
//

import SwiftUI

struct HomeView: View {
  
  static let tag: String? = "Home"
  
  @EnvironmentObject var dataController: DataController
  
    var body: some View {
      NavigationView {
        VStack {
          Button("Add Data") {
            dataController.deleteAll()
            try? dataController.createSampleDate()
          }
        }.navigationTitle("Home")
      }
      
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
