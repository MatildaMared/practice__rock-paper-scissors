//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Matilda Mared on 2022-10-21.
//

import SwiftUI

enum Choice: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
}

extension View {
    func buttonStyles() -> some View {
        modifier(StyledButton())
    }
}

struct StyledButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 150)
            .font(.title2)
            .foregroundColor(.primary)
            .padding()
            .background(.secondary)
            .foregroundStyle(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ContentView: View {
    let choices = [Choice.rock, Choice.paper, Choice.scissors]
    @State private var currentChoice = Choice.rock
    @State private var totalScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle).fontWeight(.light).foregroundStyle(.primary)
                
                Button("Rock 🪨") {
                    
                }.buttonStyles()
                
                Button("Paper 📄") {
                    
                }.buttonStyles()
                
                Button("Scissors ✂️") {
                    
                }.buttonStyles()
                
                Text("Total Score: \(totalScore)")
                    .padding()
                    .font(.subheadline)
                
                Spacer()
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
