//
//  MemoryGame.swift
//  Memorize
//
//  Created by 진승연 on 2022/01/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    private var seenCards: [Int]
    
    private(set) var score: Int
    
    
    // '_' is an external name
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                // either all cards are already faced down, or un/matching two cards are faced up
                for index in cards.indices {
                    
                    if cards[index].isFaceUp && !cards[index].isMatched {
                        if seenCards.contains(index) {
                            score -= 1
                        }
                        else {
                            seenCards.append(index)
                        }
                    }
                    
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            // flip the card that we chose
            cards[chosenIndex].isFaceUp.toggle()
        }
        // print("\(cards)")
    }
    
    /*
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    */

    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex) 
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards.shuffle()
        seenCards = []
        score = 0
    }
    
    // struct inside another struct
    // Identifiable is a single var that is used to identify this struct against all other card struct
    struct Card: Identifiable {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
