//
//  BattleViewModel.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 07.09.2021.
//

import Foundation

class BattleViewModel: ObservableObject {
    
    @Published var state: State = .battle(status: "Battle begins!")
    @Published var yourHeath: Int = 150
    @Published var opponentHeath: Int = 150
    
    let you: Superhero
    let opponent: Superhero
    
    var youHitNext: Bool
    
    init(you: Superhero, opponent: Superhero) {
        self.you = you
        self.opponent = opponent
        
        youHitNext = you.speed > opponent.speed
    }
    
    func doTurn() {
        var status = ""
        
        if yourHeath <= 0 || opponentHeath <= 0 {
            return
        }
        
        let firstAttacker = youHitNext ? you : opponent
        
        status += attack(yourTurn: firstAttacker == you)
        
        if yourHeath <= 0 || opponentHeath <= 0 {
            state = .result(won: yourHeath > 0)
            return
        }
        
        state = .battle(status: status)
        youHitNext.toggle()
    }

    private func attack(yourTurn: Bool) -> String {
        var status = ""
            
        let attacker = yourTurn ? you : opponent
        let victim = yourTurn ? opponent : you
        
        var damage = Int.random(in: 0...attacker.attack)
        let isCrit = checkRandomAbility(attacker.attack)
        let isDoubleAttack = checkRandomAbility(attacker.speed)
        let isDodge = checkRandomAbility(attacker.defence)

        if isCrit {
            status += "\(attacker.name) hit extra hard!\n"
            damage += 15
        }
        
        if isDoubleAttack {
            status += "\(attacker.name) got a double attack!\n"
            damage *= 2
        }

        if isDodge {
            status += "\(attacker.name) dodged the shot completely!\n"
            return status
        }

        damage -= Int((Double(victim.defence) / 100.0) * Double(damage))
        status += "\(attacker.name) hit \(victim.name) for \(damage) damage!\n"
        
        if yourTurn {
            opponentHeath -= damage
        } else {
            yourHeath -= damage
        }
        
        return status
    }

    private func checkRandomAbility(_ abilityValue: Int) -> Bool {
        let chance = abilityValue - 40
        return abilityValue > 50 && chance > Int.random(in: 0...100)
    }
    
    enum State {
        case battle(status: String)
        case result(won: Bool)
    }
}
