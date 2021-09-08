//
//  BarView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

struct BarView: View {
    
    var value: Int
    let total: Int
    let color: Color
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(color.opacity(0.2))
                GeometryReader { geomerty in
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(color)
                            .frame(width: geomerty.size.width * CGFloat(max(0,value)) / CGFloat(total))
                            .padding(2)
                        Spacer()
                    }
                }
            }
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 50, total: 80, color: .green)
    }
}
