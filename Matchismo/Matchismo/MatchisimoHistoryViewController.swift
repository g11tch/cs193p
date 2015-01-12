//
//  MatchisimoHistoryViewController.swift
//  Matchismo
//
//  Created by Jake Craige on 1/12/15.
//  Copyright (c) 2015 Jake Craige. All rights reserved.
//

import UIKit

class MatchisimoHistoryViewController: UIViewController {
  @IBOutlet weak var historyTextView: UITextView!
  
  var history: [String] = []
  
  override func viewWillAppear(animated: Bool) {
    let historyString = join("\n", history)
    historyTextView.text = historyString
  }
}
