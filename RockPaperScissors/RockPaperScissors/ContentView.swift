//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Max Zhang on 12/18/20.
//

import SwiftUI

struct ContentView: View {
    let appChoice = ["Rock", "Paper", "Scissors"]
    @State private var toWinOrLose = Bool.random()
    @State private var appPick = Int.random(in: 0 ..< 3)
    @State private var playerScore = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Text("Player Score")
                    .font(.largeTitle)
                Text("\(playerScore)")
                Text("App Choice")
                    .font(.largeTitle)
                Text("\(appChoice[appPick])")
                Text("To Win or To Lose")
                    .font(.largeTitle)
                if (toWinOrLose == true) {
                    Text("Win")
                }
                else {
                    Text("Lose")
                }
                Text("Please Make Your Selection")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        if (appPick == 0 && number == 1 && toWinOrLose == true) {
                            playerScore += 1
                        }
                        else if (appPick == 1 && number == 2 && toWinOrLose == true) {
                            playerScore += 1
                        }
                        else if (appPick == 2 && number == 0 && toWinOrLose == true) {
                            playerScore += 1
                        }
                    }) {
                        Text("\(appChoice[number])")
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
