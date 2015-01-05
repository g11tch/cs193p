//
//  Deck.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import Foundation

class Deck {
  var cards: [Card] = []
  
  func addCard(card: Card, atTop: Bool) {
    if atTop {
      self.cards.insert(card, atIndex: 0)
    } else {
      self.cards.append(card)
    }
  }
  
  func addCard(card: Card) {
    self.addCard(card, atTop: false)
  }
  
  func drawRandomCard() -> Card? {
    var randomCard: Card? = nil
    
    if self.cards.count > 0 {
      let index = Int(arc4random()) % self.cards.count
      randomCard = self.cards[index]
      self.cards.removeAtIndex(index)
    }
    
    return randomCard
  }
}