//
//  ViewController.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var cardButtons: [UIButton]!
  @IBOutlet weak var scoreLabel: UILabel!
  
  var deck = PlayingCardDeck()
  
  lazy var game: CardMatchingGame = {
    return CardMatchingGame(cardCount: self.cardButtons.count, deck: self.createDeck())
  }()
  
  func createDeck() -> PlayingCardDeck {
    return PlayingCardDeck()
  }
  
  @IBAction func touchedCard(sender: UIButton) {
    if let chosenButtonIndex = find(self.cardButtons, sender) {
      game.chooseCardAtIndex(chosenButtonIndex)
      updateUI()
    }
  }
  
  @IBAction func touchedDealNewDeckButton(sender: UIButton) {
    self.resetGame()
  }
  
  func resetGame() {
    deck = self.createDeck()
    game =  CardMatchingGame(cardCount: self.cardButtons.count, deck: deck)
    self.updateUI()
  }
  
  func updateUI() {
    for (index, cardButton) in enumerate(cardButtons) {
      if let card = game.cardAtIndex(index) {
        cardButton.setBackgroundImage(backgroundImageForCard(card), forState: UIControlState.Normal)
        cardButton.setTitle(titleForCard(card), forState: UIControlState.Normal)
        cardButton.enabled = !card.isMatched()
        scoreLabel.text = "Score \(game.score)"
      }
    }
  }
  
  func titleForCard(card: Card) -> String {
    return card.isChosen() ? card.contents : ""
  }
  
  func backgroundImageForCard(card: Card) -> UIImage {
    let name = card.isChosen() ? "cardfront" : "cardback"
    return UIImage(named: name)!
  }
}

