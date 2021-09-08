//
//  BattleView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 07.09.2021.
//

import SwiftUI
import Combine

struct BattleView: View {
    
    private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    @ObservedObject private var viewModel: BattleViewModel
    
    init(you: Superhero, opponent: Superhero) {
        viewModel = BattleViewModel(you: you, opponent: opponent)
    }
    
    var body: some View {
        ZStack {
            Color("standardBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                SuperViewProfileCompactView(superhero: viewModel.opponent, health: viewModel.opponentHeath)
                    .frame(width: 200.0)
                
                Spacer()
                
                switch viewModel.state {
                case .battle(let status):
                    Text(status)
                        .font(.system(size: 20.0, weight: .medium, design: .rounded))
                        .padding()
                case .result(let won):
                    Text(won ? "Great victory 🏆" : "You're dead ☠️")
                        .font(.system(size: 20.0, weight: .medium, design: .rounded))
                        .padding()
                }
                
                Spacer()
                
                SuperViewProfileCompactView(superhero: viewModel.you, health: viewModel.yourHeath)
                    .frame(width: 200.0)
            }
            .padding()
        }
        .navigationTitle("Battle")
        .onReceive(timer) { _ in
            viewModel.doTurn()
        }
        .animation(.default)
    }
    
}
