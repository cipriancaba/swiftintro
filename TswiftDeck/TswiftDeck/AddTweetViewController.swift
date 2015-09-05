//
//  AddTweetViewController.swift
//  TswiftDeck
//
//  Created by Ciprian Caba on 28/08/15.
//  Copyright (c) 2015 Ciprian Caba. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class AddTweetViewController: UIViewController {
  
  @IBOutlet var messageTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func onDone(sender: UIBarButtonItem) {
    TwitterService.tweet(messageTextView.text, onComplete: { () -> Void in
      navigationController?.popViewControllerAnimated(true)
    })
  }
}