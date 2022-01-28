//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 진승연 on 2022/01/06.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // "free" init
    // pointer 'game' won't change
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
