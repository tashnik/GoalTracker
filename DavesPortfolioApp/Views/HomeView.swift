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
          ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue,  Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack {
              Button("Add Goals") {
                dataController.deleteAll()
                try? dataController.createSampleDate()
              }.foregroundColor(.white)
              .font(.largeTitle)
            }.navigationTitle("Home").foregroundColor(.white)
          }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
