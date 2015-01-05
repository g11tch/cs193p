//
//  PlayingCardTest.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import XCTest
import Matchismo

class PlayingCardTest: XCTestCase {
  func testInitWithSuitAndRank() {
    let card = PlayingCard(suit: "H", rank: 2)
    XCTAssertEqual(card.suit, "H")
    XCTAssert(card.rank == 2)
  }
  
  func testSetInvalidSuitSetsDefault() {
    let card = PlayingCard(suit: "X", rank: 2)
    XCTAssertEqual(card.suit, "?")
  }
  
  func testSetValidSuit() {
    let card = PlayingCard(suit: "H", rank: 2)
    XCTAssertEqual(card.suit, "H")
  }
  
  func testSetInvalidRankSetsDefault() {
    let card = PlayingCard(suit: "H", rank: 25)
    XCTAssert(card.rank == 0)
  }
  
  func testSetValidRank() {
    let card = PlayingCard(suit: "H", rank: 2)
    XCTAssert(card.rank == 2)
  }
  
  func testMatchSameRank() {
    let card1 = PlayingCard(suit: "H", rank: 2)
    let card2 = PlayingCard(suit: "S", rank: 2)
    let score = card1.match([card2])
    
    XCTAssert(score == 4)
  }
  
  func testMatchSameSuit() {
    let card1 = PlayingCard(suit: "H", rank: 2)
    let card2 = PlayingCard(suit: "H", rank: 3)
    let score = card1.match([card2])
    
    XCTAssert(score == 1)
  }
  
  func testMatchNone() {
    let card1 = PlayingCard(suit: "S", rank: 2)
    let card2 = PlayingCard(suit: "H", rank: 3)
    let score = card1.match([card2])
    
    XCTAssert(score == 0)
  }
}