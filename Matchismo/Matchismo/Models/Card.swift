//
//  Card.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import Foundation

class Card {
  var contents = ""
  var chosen = false
  var matched = false
  
  init() { }
  convenience init(contents: String) {
    self.init()
    self.contents = contents
  }
  
  func isChosen() -> Bool { return chosen; }
  func isMatched() -> Bool { return matched; }
  
  func match(otherCards: [Card]) -> Int {
    return otherCards.reduce(0, { score, card in
      if card.contents == self.contents {
        return score + 1
      } else {
        return score
      }
    })
  }
}

