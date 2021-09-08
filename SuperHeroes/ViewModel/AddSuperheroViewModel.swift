//
//  AddSuperheroViewModel.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 07.09.2021.
//

import SwiftUI

class AddSuperheroViewModel: ObservableObject {
    
    @Published var heroColor: Color = Color.red
    @Published var name: String = "" {
        didSet {
            validateInput()
        }
    }
    
    @Published var attackValue: Int = 1 {
        didSet {
            validateInput()
        }
    }
    
    @Published var speedValue: Int = 1 {
        didSet {
            validateInput()
        }
    }
    
    @Published var defenceValue: Int = 1 {
        didSet {
            validateInput()
        }
    }
    
    @Published var isValidUser: Bool = false
    
    func createSuperhero() -> Superhero? {
        return Superhero(name: name,
                         avatarUrl: nil,
                         color: heroColor.hex ?? 0x000000,
                         attack: attackValue,
                         speed: speedValue,
                         defence: defenceValue)
    }
    
    private func validateInput() {
        isValidUser = Superhero(name: name,
                                avatarUrl: nil,
                                color: heroColor.hex ?? 0x000000,
                                attack: attackValue,
                                speed: speedValue,
                                defence: defenceValue) != nil
    }
}
