//
//  CardMatchingGameTest.swift
//  Matchismo
//
//  Created by Jake Craige on 1/5/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import XCTest
import Matchismo

class CardMatchingGameTest: XCTestCase {
  func generateDeckWithNumCards(count: Int) -> Deck {
    let deck = Deck()
    
    for _ in 1...count {
      deck.addCard(Card())
    }
    
    return deck
  }
  
  func generateDeckWithPlayingCards(cards: [PlayingCard]) -> Deck {
    let deck = Deck()
    
    for card in cards {
      deck.addCard(card)
    }
    
    return deck
  }
  
  func testInitializeWithCards() {
    let deck = generateDeckWithNumCards(2)
    let game = CardMatchingGame(cardCount: 1, deck: deck)
    
    XCTAssertEqual(game.cards.count, 2)
  }
  
  func testCardAtindexReturnsCard() {
    let deck = generateDeckWithNumCards(2)
    let game = CardMatchingGame(cardCount: 1, deck: deck)
    let card = game.cardAtIndex(0)
    
    XCTAssertNotNil(card)
  }
  
  func testCardAtindexReturnsNil() {
    let deck = generateDeckWithNumCards(2)
    let game = CardMatchingGame(cardCount: 1, deck: deck)
    let card = game.cardAtIndex(50)
    
    XCTAssertNil(card)
  }
  
  func testChooseCardAtIndex() {
    let deck = generateDeckWithPlayingCards([
      PlayingCard(suit: "H", rank: 2),
      PlayingCard(suit: "S", rank: 2)
    ])
    let game = CardMatchingGame(cardCount: 2, deck: deck)
    
    game.chooseCardAtIndex(0)
    XCTAssertEqual(game.score, -1) // sub CostToChoose
    
    game.chooseCardAtIndex(1)
    XCTAssertEqual(game.score, 14)
  }
}