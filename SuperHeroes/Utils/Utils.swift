//
//  Utils.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI

extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255)
    }
    
    var hex: UInt32? {
        let color = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            var colorAsUInt : UInt32 = 0
            colorAsUInt += UInt32(red * 255.0) << 16 +
                           UInt32(green * 255.0) << 8 +
                           UInt32(blue * 255.0)
            return colorAsUInt
        }
        
        return nil
    }
}
