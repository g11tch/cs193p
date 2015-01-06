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
  var lastAction = ""
  let MismatchPenalty = 2
  let MatchBonus = 4
  let CostToChoose = 1
  
  enum GameMode {
    case TwoCard
    case ThreeCard
  }
  
  var mode: GameMode = GameMode.TwoCard
  
  init(cardCount: Int, deck: Deck) {
    for _ in 0...cardCount {
      if let card = deck.drawRandomCard() {
        cards.append(card)
      }
    }
  }
  
  func chooseCardAtIndex(index: Int) {
    if let card = cardAtIndex(index) {
      var scoreDelta = 0
      if visibleAndNotMatched(card) {
        card.chosen = false
      } else {
        score -= CostToChoose
        card.chosen = true
        
        let possibleMatchCards = cards.filter(visibleAndNotMatched).filter({$0 !== card})
        
        if notEnoughCardsToAttemptMatch(possibleMatchCards) {
          lastAction = ""
          return
        }
        
        let matchScore = card.match(possibleMatchCards)
        
        if matchScore > 0 {
          scoreDelta += matchScore * MatchBonus
          
          card.matched = true
          for otherCard in possibleMatchCards {
            otherCard.matched = true
          }
        } else {
          scoreDelta -= MismatchPenalty
          
          for otherCard in possibleMatchCards {
            otherCard.chosen = false
          }
        }
        
        updateLastAction(card, otherCards: possibleMatchCards, scoreDelta: scoreDelta)
        score += scoreDelta
      }
    }
  }
  
  func updateLastAction(card: Card, otherCards: [Card], scoreDelta: Int) {
    let allCards = [card] + otherCards
    let cards = join(" ", allCards.map({ $0.contents }))
    
    if scoreDelta > 0 {
      lastAction = "Matched \(cards) for \(scoreDelta) points"
    } else {
      lastAction = "\(cards) don't match! \(abs(scoreDelta)) point penalty!"
    }
  }
  
  func notEnoughCardsToAttemptMatch(cards: [Card]) -> Bool {
    return cards.count < (numCardsForMatch() - 1)
  }
  
  func numCardsForMatch() -> Int {
    if mode == GameMode.TwoCard {
      return 2
    } else if mode == GameMode.ThreeCard {
      return 3
    } else {
      return 0
    }
  }
  
  func visibleAndNotMatched(card: Card) -> Bool {
    return card.isChosen() && !card.isMatched()
  }
  
  func cardAtIndex(index: Int) -> Card? {
    if index < cards.count {
      return cards[index]
    }
    return nil
  }
}