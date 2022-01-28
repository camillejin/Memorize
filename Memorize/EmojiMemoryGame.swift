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
    
    // the order of properties being initialized is random

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        
        let chosenThemeEmojis = theme.emojis.shuffled()
        var chosenThemeEmojisCount: Int
        
        if theme.numberOfPairsOfCards > chosenThemeEmojis.count {
            chosenThemeEmojisCount = chosenThemeEmojis.count
        }
        else {
            chosenThemeEmojisCount = theme.numberOfPairsOfCards
        }
        
        return MemoryGame<String>(numberOfPairsOfCards: chosenThemeEmojisCount) { pairIndex in
            chosenThemeEmojis[pairIndex]
        }
    }
    
    // Viewmodel publishes that something changed everytime its model changes
    @Published private var model: MemoryGame<String>
    
    private var chosenTheme: Theme
    
    // in init, you can control the order in which vars get initialized
    init() {
        chosenTheme = Theme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }
    
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var themeName: String {
        chosenTheme.name
    }
    
    func themeColor() -> Color {
        switch chosenTheme.baseColor {
        case "red":
            return Color.red
        case "yellow":
            return Color.yellow
        case "blue":
            return Color.blue
        case "pink":
            return Color.pink
        case "purple":
            return Color.purple
        case "green":
            return Color.green
        default:
            return Color.gray
        }
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    func newGame() {
        chosenTheme = Theme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
