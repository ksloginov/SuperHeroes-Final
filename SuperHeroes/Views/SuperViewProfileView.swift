//
//  SuperViewProfileView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

struct SuperViewProfileView: View {
    
    let superhero: Superhero
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 16.0) {
                VStack(spacing: 10.0) {
                    SuperViewAvatarView(superhero: superhero)
                        .aspectRatio(1.0, contentMode: .fit)
                    Text(superhero.name)
                        .font(.system(size: 20.0, weight: .heavy, design: .rounded))
                        .lineLimit(1)
                }
                .frame(width: proxy.size.width / 2.0)
                
                VStack(spacing: 0.0) {
                    BarBlockView(title: "Attack:",
                                 value: superhero.attack,
                                 total: Superhero.MAX_SKILL_VALUE,
                                 color: .red)
                    BarBlockView(title: "Speed:",
                                 value: superhero.speed,
                                 total: Superhero.MAX_SKILL_VALUE,
                                 color: .blue)
                    BarBlockView(title: "Defence:",
                                 value: superhero.defence,
                                 total: Superhero.MAX_SKILL_VALUE,
                                 color: .green)
                }
                .frame(width: proxy.size.width / 2.0)
            }
        }
        .frame(height: 180.0)
    }
}

struct SuperViewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SuperViewProfileView(
            superhero: Superhero(
                name: "Captan America",
                avatarUrl: "captain-america",
                color: 0xFA5311,
                attack: 51,
                speed: 32,
                defence: 37)!)
    }
}
