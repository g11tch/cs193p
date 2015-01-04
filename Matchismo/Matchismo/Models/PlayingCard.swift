//
//  PlayingCard.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import Foundation

class PlayingCard : Card {
    class var validSuits : [String] {
         return ["H", "D", "S", "C"]
    }
    
    class var rankStrings : [String] {
        return ["?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10",
                "J", "K", "Q"]
    }
    
    class var maxRank : Int {
        return self.rankStrings.count - 1;
    }
    
    // There has to be a better way to set up the getter/setter for suit and rank
    var _suit = "?"
    var suit : String {
        get {
            return self._suit
        }
        set {
            if contains(PlayingCard.validSuits, newValue) {
                self._suit = newValue
            } else {
                self._suit = "?"
            }
        }
    }
    
    var _rank = 0
    var rank : Int {
        get {
            return self._rank
        }
        set {
            if newValue <= PlayingCard.maxRank {
                self._rank = newValue;
            }
        }
    }
    
    override var contents : String {
        get {
            return PlayingCard.rankStrings[self.rank] + self.suit
        }
        set {
            self.contents = newValue
        }
    }
}