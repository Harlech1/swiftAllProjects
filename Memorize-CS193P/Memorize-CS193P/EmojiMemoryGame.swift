//
//  EmojiMemoryGame.swift
//  Memorize-CS193P
//
//  Created by Turker Kizilcik on 3.09.2023.
//

import SwiftUI

class EmojiMemoryGame {
    
    private static let emojis = ["👻","🎃","🕷️","😈","💀","❄️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "😅"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
