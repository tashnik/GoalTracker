//
//  Binding-OnChange.swift
//  DavesPortfolioApp
//
//  Created by Tashnik on 11/5/20.
//

import SwiftUI

extension Binding {
  
  func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
    
    Binding(
      get: { self.wrappedValue },
      set: { newValue in
        self.wrappedValue = newValue
        handler()
      }
    )
  }
}
