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
              emojis: ["โ๏ธ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "โต๏ธ", "๐", "๐ถ", "๐", "๐", "๐ต", "๐ ", "๐บ", "๐", "๐ป", "๐", "๐ธ" , "๐"],
              numberOfPairsOfCards: 24,
              baseColor: "red"),
        Theme(name: "gestures",
              emojis: ["๐", "๐", "๐", "๐", "๐ช", "๐", "๐", "๐", "๐", "๐", "๐", "๐คฒ", "๐ค", "๐", "๐ค", "๐", "โ๏ธ", "๐ค", "๐ค","๐"],
              numberOfPairsOfCards: 16,
              baseColor: "yellow"),
        Theme(name: "pink",
              emojis: ["๐", "๐ซ", "๐ง ", "๐", "๐", "๐ฝ", "๐ธ", "๐", "๐", "๐", "๐", "๐", "๐", "๐ซ"],
              numberOfPairsOfCards: 8,
              baseColor: "pink"),
        Theme(name: "green",
              emojis: ["๐คข", "๐งโ๐ค", "๐ฉฒ", "๐งค", "๐ช", "๐ธ", "๐ข", "๐ฆ", "๐ฆ", "๐", "๐", "๐ฆ", "๐ต", "๐ณ", "๐", "๐ฟ", "๐", "๐ฅฆ", "๐ฅฌ", "๐ฅ", "๐ซ", "๐ซ", "๐ช", "๐พ", "๐ฅ", "๐งฉ", "โป๏ธ", "๐"],
              numberOfPairsOfCards: Int.random(in: 4..<20),
              baseColor: "green"),
        Theme(name: "people",
              emojis: ["๐ง", "๐ฎโโ๏ธ", "๐ฎโโ๏ธ", "๐ทโโ๏ธ", "๐โโ๏ธ", "๐ต๏ธโโ๏ธ", "๐ต๏ธโโ๏ธ", "๐งโโ๏ธ", "๐งโ๐พ", "๐งโ๐ณ", "๐งโ๐", "๐งโ๐ซ", "๐งโ๐ญ", "๐งโ๐ป", "๐งโ๐ง", "๐งโ๐ฌ", "๐งโ๐จ", "๐งโ๐", "๐งโโ๏ธ", "๐งโ๐", "๐งโโ๏ธ", "๐ฐ"],
              numberOfPairsOfCards: 22,
              baseColor: "blue"),
        Theme(name: "travel",
              emojis: ["๐ฟ", "๐ฝ", "๐ผ", "๐ฐ", "๐ฏ", "๐", "๐", "๐", "๐", "โฉ","๐", "๐", "๐", "โช๏ธ"],
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

