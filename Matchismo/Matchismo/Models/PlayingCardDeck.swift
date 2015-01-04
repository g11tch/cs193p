//
//  PlayingCardDeck.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import Foundation

class PlayingCardDeck : Deck {
    override init() {
        super.init()
        for suit : String in PlayingCard.validSuits {
            for rank : Int in 1...PlayingCard.maxRank {
                let card = PlayingCard(suit: suit, rank: rank)
                self.addCard(card)
            }
        }
    }
}
