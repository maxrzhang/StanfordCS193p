//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Max Zhang on 11/16/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Button(action: {
                self.viewModel.resetGame()
            }) {
                Text("New Game")
            }
            Text("\(viewModel.score)")
            Grid(viewModel.cards) { card in
                CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding()
            }
                .padding()
                .foregroundColor(viewModel.themeColor)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90)).padding(5).opacity(0.4)
                Text(card.content).font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
    }
}
