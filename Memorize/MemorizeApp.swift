//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 진승연 on 2022/01/06.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame() // "free" init
    // pointer 'game' won't change
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
