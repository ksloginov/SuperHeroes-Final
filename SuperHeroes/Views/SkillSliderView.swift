//
//  SkillSliderView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 07.09.2021.
//

import SwiftUI

struct SkillSliderView: View {
    
    let label: String
    let maxValue: Double
    let minValue: Double
    @Binding var value: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text("\(value)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Slider(value:
                    Binding<Double>(get: {
                        return Double(value)
                    },
                    set: { newValue in
                        value = Int(newValue)
                    }),
                   in: minValue...maxValue,
                   step: 1.0,
                   onEditingChanged: { _ in },
                   minimumValueLabel: Text("\(Int(minValue))"),
                   maximumValueLabel: Text("\(Int(maxValue))")) {
                Text(label)
            }
            .padding(.top, 4.0)
        }
    }
}
