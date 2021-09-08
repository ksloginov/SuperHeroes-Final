//
//  SuperheroRepository.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 05.09.2021.
//

import Foundation

class SuperheroRepository {
    
    var heroes: [Superhero] {
        didSet {
            if let data = try? JSONEncoder().encode(heroes) {
                UserDefaults.standard.set(data, forKey: "heroesCache")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "heroesCache"), let cachedHeroes = try? JSONDecoder().decode([Superhero].self, from: data) {
            heroes = cachedHeroes
        } else {
            heroes = SuperheroRepository.provideDefaultSuperheroes()
        }
    }
    
    func addHero(_ superhero: Superhero) {
        heroes.append(superhero)
    }
    
    func previousSuperhero(_ currentSuperhero: Superhero?) -> Superhero? {
        guard let currentSuperhero = currentSuperhero else { return nil }
        if let index = heroes.firstIndex(of: currentSuperhero), index > 0 {
            return heroes[index - 1]
        }
        
        return nil
    }
    
    func nextSuperhero(_ currentSuperhero: Superhero?) -> Superhero? {
        guard let currentSuperhero = currentSuperhero else { return nil }
        if let index = heroes.firstIndex(of: currentSuperhero), index < heroes.count - 1 {
            return heroes[index + 1]
        }
        
        return nil
    }
}

extension SuperheroRepository {
    
    static func provideDefaultSuperheroes() -> [Superhero] {
        return [Superhero(name: "Captan America",
                          avatarUrl: "captain-america",
                          color: 0xFA5311,
                          attack: 51,
                          speed: 12,
                          defence: 37),
                Superhero(name: "Dr. Doom",
                          avatarUrl: "doctordoom",
                          color: 0x333333,
                          attack: 60,
                          speed: 10,
                          defence: 30),
                Superhero(name: "Gambit",
                          avatarUrl: "gambit",
                          color: 0x800080,
                          attack: 27,
                          speed: 13,
                          defence: 60),
                Superhero(name: "Invisible Woman",
                          avatarUrl: "invisiblewoman",
                          color: 0xFA5311,
                          attack: 23,
                          speed: 47,
                          defence: 30),
                Superhero(name: "Loki",
                          avatarUrl: "loki",
                          color: 0x097969,
                          attack: 51,
                          speed: 14,
                          defence: 35),
                Superhero(name: "War Machine",
                          avatarUrl: "warmachine",
                          color: 0xFF5733,
                          attack: 60,
                          speed: 5,
                          defence: 35)
                
        ].compactMap({$0})
    }
    
}
