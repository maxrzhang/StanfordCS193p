//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Max Zhang on 11/17/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    var score: Int {model.score}
    static var theme = Theme.themes.randomElement()
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme!.emojis.count) {pairIndex in
            return theme!.emojis[pairIndex]
        }
    }
    struct Theme {
        var name: String
        var emojis: [String]
        var cardsNumber: Int?
        var color: Color
        static let halloween = Theme(name: "halloweenEmojis", emojis: ["👻","🎃","🕷"], color: Color.orange)
        static let animals = Theme(name: "animalEmojis", emojis: ["🦊","🐯","🐮"], color: Color.yellow)
        static let food = Theme(name: "foodEmojis", emojis: ["🍎","🍇","🌶"], color: Color.red)
        static var themes = [halloween, animals, food]
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    var themeColor: Color {
        return EmojiMemoryGame.theme!.color
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    func resetGame() {
        EmojiMemoryGame.theme = Theme.themes.randomElement()
        model = EmojiMemoryGame.createMemoryGame()
    }
}
