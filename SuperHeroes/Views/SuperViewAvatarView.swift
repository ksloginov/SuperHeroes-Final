//
//  SuperViewAvatarView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

struct SuperViewAvatarView: View {
    
    let superhero: Superhero
    
    var body: some View {
        GeometryReader{ geometry in
            
            let side = min(
                geometry.size.width,
                geometry.size.height)
            
            ZStack {
                Color(hex: superhero.color)
                
                ZStack {
                    if let avatarUrl = superhero.avatarUrl {
                        Image(avatarUrl)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Text(superhero.name.prefix(1))
                            .fontWeight(.heavy)
                            .font(.system(size: 36.0))
                    }
                }
                .frame(width: max(side - 12.0, 0.0),
                       height: max(side - 12.0, 0.0))
                .cornerRadius(side - 12.0)
                    
            }
            .aspectRatio(1.0, contentMode: .fit)
            .cornerRadius(side)
        }
        
    }
}

struct SuperViewAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SuperViewAvatarView(
        superhero: Superhero(
            name: "Captan America",
            avatarUrl: "captain-america",
            color: 0xFA5311,
            attack: 51,
            speed: 32,
            defence: 37)!)
    }
}
