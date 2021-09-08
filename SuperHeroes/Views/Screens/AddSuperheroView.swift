//
//  AddSuperheroView.swift
//  SuperHeroes
//
//  Created by Konstantin Loginov on 06.09.2021.
//

import SwiftUI

struct AddSuperheroView: View {

    var repository: SuperheroRepository
    @ObservedObject private var viewModel = AddSuperheroViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack {
                Text("Create you own character")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                Divider()
                Group {
                    TextField("What's your superhero's name?", text: $viewModel.name)
                        .padding(.vertical)
                    Divider()
                }
                skillSliderBlock
                ColorPicker(selection: $viewModel.heroColor) {
                    Text("Primary color")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.top)
                Spacer()
                Button(action: {
                    if let hero = viewModel.createSuperhero() {
                        repository.addHero(hero)
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundColor(viewModel.isValidUser ? .white : .gray)
                        Text("Add a hero")
                            .foregroundColor(Color("standardBackground"))
                            .font(.headline)
                            .padding()
                    }
                    .frame(height: 44.0)
                })
                .disabled(!viewModel.isValidUser)
                
            }
            .padding()
    }
    
    var skillSliderBlock: some View {
        Group {
            HStack {
                Text("Choose base parameters (Total: \(Superhero.TOTAL_OF_SKILLS_VALUE))")
                    .font(.headline)
                Spacer()
            }
            .padding(.top)
            
            Divider()
                .padding(.vertical)
            
            SkillSliderView(label: "Attack",
                            maxValue: Double(Superhero.MAX_SKILL_VALUE),
                            minValue: 1,
                            value: $viewModel.attackValue)
            
            Divider()
                .padding(.vertical)
            
            SkillSliderView(label: "Speed",
                            maxValue: Double(Superhero.MAX_SKILL_VALUE),
                            minValue: 1,
                            value: $viewModel.speedValue)
            
            Divider()
                .padding(.vertical)
            
            SkillSliderView(label: "Defence",
                            maxValue: Double(Superhero.MAX_SKILL_VALUE),
                            minValue: 1,
                            value: $viewModel.defenceValue)
            
            Divider()
                .padding(.vertical)
        }
    }
}

struct AddSuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        AddSuperheroView(repository: SuperheroRepository())
    }
}
