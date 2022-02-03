//
//  MemoryGame.swift
//  Memorize
//
//  Created by 진승연 on 2022/01/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter( { cards[$0].isFaceUp } ).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0  == newValue) } }
    }
    
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
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                // either all cards are already faced down, or un/matching two cards are faced up
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex) 
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    // struct inside another struct
    // Identifiable is a single var that is used to identify this struct against all other card struct
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        
        // content and id never changes -> let
        let content: CardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return first
        } else {
            return nil
        }
    }
}
