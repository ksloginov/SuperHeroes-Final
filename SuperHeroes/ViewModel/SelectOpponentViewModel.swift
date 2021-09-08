//
//  BattleViewModel.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 02.09.2021.
//

import SwiftUI


class SelectOpponentViewModel: ObservableObject {
    
    @Published var mySuperhero: Superhero?
    @Published var opponentSuperhero: Superhero?

}
