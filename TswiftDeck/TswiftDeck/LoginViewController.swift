//
//  LoginViewController.swift
//
//
//  Created by Ciprian Caba on 28/08/15.
//
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let logInButton = TWTRLogInButton { (session, error) in
      // play with Twitter sessions
      if let error = error {
        println("There was an error authenticating \(error)")
      } else {
        println("user \(session.userName)")
        self.performSegueWithIdentifier("showMainTab", sender: nil)
      }
    }
    
    logInButton.center = self.view.center
    self.view.addSubview(logInButton)
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if let session = Twitter.sharedInstance().session() {
      self.performSegueWithIdentifier("showMainTab", sender: nil)
    } else {
      println("User is not logged in")
    }
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
