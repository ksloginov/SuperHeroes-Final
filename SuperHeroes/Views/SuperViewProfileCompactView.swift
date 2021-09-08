//
//  SuperViewProfileCompactView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

struct SuperViewProfileCompactView: View {
    
    let superhero: Superhero
    let health: Int
    
    var body: some View {
        VStack {
            SuperViewAvatarView(superhero: superhero)
                .aspectRatio(1.0, contentMode: .fit)
            BarView(value: health, total: Superhero.TOTAL_HEATH, color: healthColor)
                .frame(height: 16.0)
                .padding()
        }
    }
    
    var healthColor: Color {
        switch health {
        case ..<(Superhero.TOTAL_HEATH / 4):
            return .red
        case Superhero.TOTAL_HEATH / 4..<Superhero.TOTAL_HEATH * 3 / 4:
            return .yellow
        default:
            return .green
        }
    }
}
