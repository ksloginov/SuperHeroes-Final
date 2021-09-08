//
//  SuperHeroesApp.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

@main
struct SuperHeroesApp: App {
    init() {
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SelectOpponentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .preferredColorScheme(.dark)
            .accentColor(.white)
        }
    }
}
