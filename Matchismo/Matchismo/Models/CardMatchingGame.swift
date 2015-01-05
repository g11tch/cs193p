//
//  CardMatchingGame.swift
//  Matchismo
//
//  Created by Jake Craige on 1/5/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import Foundation

class CardMatchingGame {
  var score = 0
  var cards: [Card] = []
  let MismatchPenalty = 2
  let MatchBonus = 4
  let CostToChoose = 1
  
  init(cardCount: Int, deck: Deck) {
    for _ in 0...cardCount {
      if let card = deck.drawRandomCard() {
        cards.append(card)
      }
    }
  }
  
  func chooseCardAtIndex(index: Int) {
    if let card = cardAtIndex(index) {
      if !card.isMatched() {
        if card.isChosen() {
          card.chosen = false
        } else {
          for otherCard in cards {
            if otherCard.isChosen() && !otherCard.isMatched() {
              let matchScore = card.match([otherCard])
              
              if matchScore > 0 {
                score += matchScore * MatchBonus
                otherCard.matched = true
                card.matched = true
              } else {
                score -= MismatchPenalty
                otherCard.chosen = false
              }
              break // can only choose 2 cards for now
            }
          }
          score -= CostToChoose
          card.chosen = true
        }
      }
    }
  }
  
  func cardAtIndex(index: Int) -> Card? {
    if index < cards.count {
      return cards[index]
    }
    return nil
  }
}