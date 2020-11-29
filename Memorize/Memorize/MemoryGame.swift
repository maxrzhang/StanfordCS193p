//
//  MemoryGame.swift
//  Memorize
//
//  Created by Max Zhang on 11/17/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter { cards[$0].isFaceUp}.only}
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        let faceUpCardIndices = cards.indices.filter {cards[$0].isFaceUp}
        if faceUpCardIndices.count > 1 {
            for index in cards.indices {
                if cards[index].isFaceUp {
                    cards[index].alreadyBeenSeen = true
                    cards[index].isFaceUp = false
                }
            }
        }
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            cards[chosenIndex].isFaceUp = true
            if faceUpCardIndices.count == 1 {
                if cards[faceUpCardIndices[0]].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[faceUpCardIndices[0]].isMatched = true
                    score += 2
                }
                else {
                    if cards[chosenIndex].alreadyBeenSeen {
                        score -= 1
                    }
                    if cards[faceUpCardIndices[0]].alreadyBeenSeen {
                        score -= 1
                    }
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var alreadyBeenSeen = false
        var content: CardContent
        var id: Int
    }
}
