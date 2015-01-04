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
}