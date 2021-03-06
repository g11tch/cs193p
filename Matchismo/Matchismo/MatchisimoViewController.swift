//
//  ViewController.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import UIKit

class MatchisimoViewController: UIViewController {
  @IBOutlet var cardButtons: [UIButton]!
  @IBOutlet weak var scoreLabel: UILabel!
  
  var deck = PlayingCardDeck()
  var game: CardMatchingGame!
  var gameHistory: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createGame()
    updateUI()
  }
  
  @IBAction func touchedCard(sender: UIButton) {
    if let chosenButtonIndex = find(cardButtons, sender) {
      game.chooseCardAtIndex(chosenButtonIndex)
      updateUI()
    }
  }
  
  @IBAction func touchedDealButton(sender: UIBarButtonItem) {
    createGame()
    updateUI()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "Show History" {
      let vc = segue.destinationViewController as MatchisimoHistoryViewController
      vc.history = gameHistory
    }
  }
  
  func createDeck() -> PlayingCardDeck {
    return PlayingCardDeck()
  }
  
  func createGame() -> CardMatchingGame {
    gameHistory = []
    deck        = createDeck()
    game        = CardMatchingGame(cardCount: cardButtons.count, deck: deck)
    game.mode   = .TwoCard
    return game
  }
  
  func updateUI() {
    for (index, cardButton) in enumerate(cardButtons) {
      if let card = game.cardAtIndex(index) {
        cardButton.setBackgroundImage(backgroundImageForCard(card), forState: UIControlState.Normal)
        cardButton.setTitle(titleForCard(card), forState: UIControlState.Normal)
        cardButton.enabled = !card.isMatched()
        navigationItem.title = "Score: \(game.score)"
        if game.lastAction != gameHistory.last && countElements(game.lastAction) > 0 {
          gameHistory.append(game.lastAction)
        }
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

