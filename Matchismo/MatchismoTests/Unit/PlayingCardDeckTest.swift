//
//  PlayingCardDeckTest.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import XCTest
import Matchismo

class PlayingCardDeckTest: XCTestCase {
  func testInitCreatesFullCardDeck() {
    let deck = PlayingCardDeck()
    XCTAssertEqual(deck.cards.count, 52)
  }
}