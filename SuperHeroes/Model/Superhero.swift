//
//  Superhero.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import Foundation

struct Superhero: Identifiable, Equatable, Codable {
    static let MAX_SKILL_VALUE: Int = 60
    static let TOTAL_OF_SKILLS_VALUE: Int = 100
    static let TOTAL_HEATH: Int = 150
    
    let id: Int
    let name: String
    let avatarUrl: String?
    let color: UInt32
    
    let attack: Int
    let speed: Int
    let defence: Int
    
    init?(name: String, avatarUrl: String?, color: UInt32, attack: Int, speed: Int, defence: Int) {
        guard attack + speed + defence == Superhero.TOTAL_OF_SKILLS_VALUE, attack <= Superhero.MAX_SKILL_VALUE, speed <= Superhero.MAX_SKILL_VALUE, defence <= Superhero.MAX_SKILL_VALUE, attack > 0, speed > 0, defence > 0, !name.isEmpty else {
            return nil
        }
        
        self.id = name.hash
        self.name = name
        self.avatarUrl = avatarUrl
        self.color = color
        self.attack = attack
        self.speed = speed
        self.defence = defence
    }
}
