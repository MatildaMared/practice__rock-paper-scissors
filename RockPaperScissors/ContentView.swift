//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Matilda Mared on 2022-10-21.
//

import SwiftUI

enum Choice: String {
    case rock = "Rock 🪨"
    case paper = "Paper 📄"
    case scissors = "✂️ Scissors"
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
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    func resetState() {
        totalScore = 0
        alertTitle = ""
        alertMessage = ""
    }
    
    func makeGuess(_ userGuess: Choice) {
        let computerGuess = choices[Int.random(in: 0...2)]
        print(computerGuess)
        var hasWon: Bool
        
        switch computerGuess {
        case .scissors:
            if userGuess == .rock {
                hasWon = true
            } else {
                hasWon = false
            }
        case .rock:
            if userGuess == .paper {
                hasWon = true
            } else {
                hasWon = false
            }
        case .paper:
            if userGuess == .scissors {
                hasWon = true
            } else {
                hasWon = false
            }
        }
        
        if hasWon {
            alertTitle = "Correct!"
            alertMessage = "You chose \(userGuess) and the computer chose \(String(describing: computerGuess)) which means you won! Keep up the good work 🥳"
            totalScore += 1
        } else {
            alertTitle = "Incorrect!"
            alertMessage = "You chose \(userGuess) and the computer chose \(String(describing: computerGuess)) which means you lost.. 😞 Better luck next time!"
        }
        
        showAlert = true
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle).fontWeight(.light).foregroundStyle(.primary)
                
                Button("Rock 🪨") {
                    makeGuess(.rock)
                }.buttonStyles()
                
                Button("Paper 📄") {
                    makeGuess(.paper)
                }.buttonStyles()
                
                Button("Scissors ✂️") {
                    makeGuess(.scissors)
                }.buttonStyles()
                
                Text("Total Score: \(totalScore)")
                    .padding()
                    .font(.subheadline)
                
                Button("Reset", action: resetState)
                    .padding()
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 8).opacity(0.8)
                
                Spacer()
                
                Spacer()
            }
            .padding()
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Continue") {
                
            }
        } message: {
            VStack {
                Text(alertMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
