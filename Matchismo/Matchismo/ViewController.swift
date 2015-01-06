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
  @IBOutlet weak var gameModeLabel: UILabel!
  @IBOutlet weak var gameModeSwitch: UISwitch!
  @IBOutlet weak var historyLabel: UILabel!
  
  var gameMode: CardMatchingGame.GameMode = CardMatchingGame.GameMode.TwoCard {
    didSet {
      if gameMode == CardMatchingGame.GameMode.TwoCard {
        gameModeLabel.text = "2 Card"
      } else {
        gameModeLabel.text = "3 Card"
      }
      if let game = game {
        game.mode = gameMode
      }
    }
  }
  
  var deck = PlayingCardDeck()
  var game: CardMatchingGame!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createGame()
    updateUI()
  }
  
  @IBAction func touchedCard(sender: UIButton) {
    gameModeSwitch.enabled = false
    if let chosenButtonIndex = find(cardButtons, sender) {
      game.chooseCardAtIndex(chosenButtonIndex)
      updateUI()
    }
  }
  
  @IBAction func touchedDealNewDeckButton(sender: UIButton) {
    gameModeSwitch.enabled = true
    historyLabel.text      = "Game History"
    createGame()
    updateUI()
  }
  
  @IBAction func requestGameModeChange(sender: UISwitch) {
    if sender.on {
      gameMode = CardMatchingGame.GameMode.ThreeCard
    } else {
      gameMode = CardMatchingGame.GameMode.TwoCard
    }
  }
  
  func createDeck() -> PlayingCardDeck {
    return PlayingCardDeck()
  }
  
  func createGame() -> CardMatchingGame {
    deck      = createDeck()
    game      = CardMatchingGame(cardCount: cardButtons.count, deck: deck)
    game.mode = gameMode
    return game
  }
  
  func updateUI() {
    historyLabel.text = game.lastAction
    for (index, cardButton) in enumerate(cardButtons) {
      if let card = game.cardAtIndex(index) {
        cardButton.setBackgroundImage(backgroundImageForCard(card), forState: UIControlState.Normal)
        cardButton.setTitle(titleForCard(card), forState: UIControlState.Normal)
        cardButton.enabled = !card.isMatched()
        scoreLabel.text    = "Score \(game.score)"
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

