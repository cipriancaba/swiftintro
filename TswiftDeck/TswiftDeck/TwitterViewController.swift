//
//  TwitterViewController.swift
//
//
//  Created by Ciprian Caba on 28/08/15.
//
//

import UIKit
import TwitterKit
import SwiftyJSON

class TwitterViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  var tweets = [Tweet]()
  var refresher: UIRefreshControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "@\(Twitter.sharedInstance().session().userName)"
    
    tableView.delegate = self
    tableView.dataSource = self
    
    refresher = UIRefreshControl()
    refresher.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
    tableView.addSubview(refresher)
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    onRefresh()
  }
  
  @IBAction func onAdd(sender: UIBarButtonItem) {
    
  }
  
  func onRefresh() {
    if refresher.refreshing {
      refresher.endRefreshing()
    }
    TwitterService.getHomeTimeline { (tweets: [Tweet]) -> Void in
      self.tweets = tweets
      self.tableView.reloadData()
      //      for tweet in tweets {
      //        println("@\(tweet.user.screenName): \(tweet.text)")
      //      }
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

extension TwitterViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}

extension TwitterViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("tweetCell") as! TweetTableViewCell
    
    cell.updateData(tweets[indexPath.row])
    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}