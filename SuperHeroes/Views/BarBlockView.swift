//
//  BarBlockView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

struct BarBlockView: View {
    
    let title: String
    let value: Int
    let total: Int
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3.0) {
            Text(title)
                .font(.title3)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            HStack {
                BarView(value: value, total: total, color: color)
                    .frame(height: 10.0)
                Spacer()
                Text(String(value))
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
        }
    }
}

struct BarBlockView_Previews: PreviewProvider {
    static var previews: some View {
        BarBlockView(title: "Attack:", value: 51, total: 80, color: .blue)
    }
}
