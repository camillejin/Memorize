//
//  Theme.swift
//  Memorize
//
//  Created by camillejin on 2022/01/26.
//

import Foundation
import SwiftUI


struct Theme {
    
    static let themes: [Theme] = [
        Theme(name: "vehicles",
              emojis: ["✈️", "🚗", "🚂", "🚀", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "⛵️", "🚝", "🛶", "🚌", "🏍", "🛵", "🚠", "🛺", "🚚", "🛻", "🚇", "🛸" , "🚛"],
              numberOfPairsOfCards: 24,
              baseColor: "red"),
        Theme(name: "gestures",
              emojis: ["👏", "🙌", "👍", "👉", "💪", "👋", "🖖", "👈", "👉", "👎", "👊", "🤲", "🤝", "👆", "🤙", "👇", "✌️", "🤟", "🤞","👐"],
              numberOfPairsOfCards: 16,
              baseColor: "yellow"),
        Theme(name: "pink",
              emojis: ["👄", "🫀", "🧠", "👚", "👛", "🐽", "🌸", "🎀", "💕", "💞", "💓", "💗", "👅", "🫁"],
              numberOfPairsOfCards: 8,
              baseColor: "pink"),
        Theme(name: "green",
              emojis: ["🤢", "🧑‍🎤", "🩲", "🧤", "🪖", "🐸", "🐢", "🦖", "🦎", "🐍", "🐊", "🦚", "🌵", "🌳", "🍀", "🌿", "🍏", "🥦", "🥬", "🥒", "🫑", "🫒", "🪀", "🎾", "🥎", "🧩", "♻️", "💚"],
              numberOfPairsOfCards: Int.random(in: 4..<20),
              baseColor: "green"),
        Theme(name: "people",
              emojis: ["🧕", "👮‍♀️", "👮‍♂️", "👷‍♀️", "💂‍♀️", "🕵️‍♀️", "🕵️‍♂️", "🧑‍⚕️", "🧑‍🌾", "🧑‍🍳", "🧑‍🎓", "🧑‍🏫", "🧑‍🏭", "🧑‍💻", "🧑‍🔧", "🧑‍🔬", "🧑‍🎨", "🧑‍🚒", "🧑‍✈️", "🧑‍🚀", "🧑‍⚖️", "👰"],
              numberOfPairsOfCards: 22,
              baseColor: "blue"),
        Theme(name: "travel",
              emojis: ["🗿", "🗽", "🗼", "🏰", "🏯", "🏟", "🏝", "🏜", "🏛", "⛩","🛕", "🕌", "🕋", "⛪️"],
              numberOfPairsOfCards: 10,
              baseColor: "purple")
    ]
    

    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var baseColor: String
    
    init(name: String,
         emojis: [String],
         numberOfPairsOfCards: Int,
         baseColor: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.baseColor = baseColor
    }
    
    init(name: String,
         emojis: [String],
         baseColor: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = emojis.count
        self.baseColor = baseColor
    }
}

