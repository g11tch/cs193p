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
  
  func testChooseCardAtIndexTwoCardMode() {
    let deck = generateDeckWithPlayingCards([
      PlayingCard(suit: "H", rank: 2),
      PlayingCard(suit: "S", rank: 2)
    ])
    let game = CardMatchingGame(cardCount: 2, deck: deck)
    game.mode = CardMatchingGame.GameMode.TwoCard
    
    game.chooseCardAtIndex(0)
    XCTAssertEqual(game.score, -1) // CostToChoose
    
    game.chooseCardAtIndex(1)
    XCTAssertEqual(game.score, 14)
  }
  
  func testNumCardsForMatchTwoCardMode() {
    let deck = generateDeckWithNumCards(2)
    let game = CardMatchingGame(cardCount: 2, deck: deck)
    game.mode = CardMatchingGame.GameMode.TwoCard
    
    XCTAssertEqual(game.numCardsForMatch(), 2)
  }
  
  func testNumCardsForMatchThreeCardMode() {
    let deck = generateDeckWithNumCards(2)
    let game = CardMatchingGame(cardCount: 2, deck: deck)
    game.mode = CardMatchingGame.GameMode.ThreeCard
    
    XCTAssertEqual(game.numCardsForMatch(), 3)
  }
  
  func testChooseCardAtIndexThreeCardMode() {
    let deck = generateDeckWithPlayingCards([
      PlayingCard(suit: "H", rank: 2),
      PlayingCard(suit: "S", rank: 2),
      PlayingCard(suit: "D", rank: 2)
    ])
    let game = CardMatchingGame(cardCount: 2, deck: deck)
    game.mode = CardMatchingGame.GameMode.ThreeCard
    
    game.chooseCardAtIndex(0)
    XCTAssertEqual(game.score, -1) // CostToChoose
    
    game.chooseCardAtIndex(1)
    XCTAssertEqual(game.score, -2) // CostToChoose
    
    game.chooseCardAtIndex(2)
    XCTAssertEqual(game.score, 29)
  }
}