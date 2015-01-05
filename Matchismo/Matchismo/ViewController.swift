//
//  ViewController.swift
//  Matchismo
//
//  Created by Jake Craige on 1/4/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var flipLabel: UILabel!
  var flipCount: Int = 0 {
    didSet {
      self.updateFlipLabel()
    }
  }
  
  let deck: PlayingCardDeck = PlayingCardDeck()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func updateFlipLabel() {
    self.flipLabel.text = "Flips: \(self.flipCount)"
  }
  
  @IBAction func touchedCard(sender: UIButton) {
    if (self.frontShowing(sender)) {
      self.showBack(sender)
    } else {
      self.showFront(sender)
    }
    self.flipCount++
  }
  
  func frontShowing(button: UIButton) -> Bool {
    let title : NSString? = button.currentTitle;
    
    return title?.length > 0;
  }
  
  func nextCardContents() -> String {
    if let card = self.deck.drawRandomCard() {
      return card.contents
    }
    
    return "No cards left"
  }
  
  func showFront(button: UIButton) {
    let contents = self.nextCardContents()
    self.setImageAndTitleFor(button, imageName: "cardfront", title: contents)
  }
  
  func showBack(button: UIButton) {
    self.setImageAndTitleFor(button, imageName: "cardback", title: "")
  }
  
  func setImageAndTitleFor(button: UIButton, imageName: String, title: String) {
    button.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
    button.setTitle(title, forState: UIControlState.Normal)
  }
}

