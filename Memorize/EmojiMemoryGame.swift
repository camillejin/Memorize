//
//  EmojiMemoryGame.swift
//  Memorize
//
//  ViewModel
//
//  Created by 진승연 on 2022/01/22.
//

import SwiftUI // it is part of the UI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["✈️", "🚗", "🚂", "🚀", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "⛵️", "🚝", "🛶", "🚌", "🏍", "🛵", "🚠", "🛺", "🚚", "🛻", "🚇", "🛸" , "🚛"]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // Viewmodel publishes that something changed everytime its model changes
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
