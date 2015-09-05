//
//  TwitterService.swift
//  TswiftDeck
//
//  Created by Ciprian Caba on 28/08/15.
//  Copyright (c) 2015 Ciprian Caba. All rights reserved.
//

import Foundation
import TwitterKit
import SwiftyJSON

class TwitterService {
  class var userName: String {
    get {
      return Twitter.sharedInstance().session().userName
    }
  }
  
  class func tweet(message: String, onComplete: () -> Void) {
    var params = [NSObject: AnyObject]()
    params["status"] = message
    
    call(
      "POST",
      endpoint: "https://api.twitter.com/1.1/statuses/update.json",
      parameters: params,
      onData: { (json: JSON) -> Void in
        onComplete()
    })
  }
  
  class func search(query: String, onComplete: ([Tweet]) -> Void) {
    var params = [NSObject: AnyObject]()
    params["q"] = query
    
    call(
      "GET",
      endpoint: "https://api.twitter.com/1.1/search/tweets.json",
      parameters: [:],
      onData: { (json: JSON) -> Void in
        var tweets = [Tweet]()
        
        for tweet in json.arrayValue {
          tweets.append(Tweet(json: tweet))
        }
        
        onComplete(tweets)
    })
  }
  
  class func postFavorite(tweetId: String, onComplete: () -> Void) -> Void {
    var params = [NSObject: AnyObject]()
    params["id"] = tweetId
    
    call(
      "POST",
      endpoint: "https://api.twitter.com/1.1/favorites/create.json",
      parameters: params,
      onData: { (json: JSON) -> Void in
        onComplete()
    })
  }
  
  class func getFavorites(onComplete: ([Tweet]) -> Void) {
    call(
      "GET",
      endpoint: "https://api.twitter.com/1.1/favorites/list.json",
      parameters: [:],
      onData: { (json: JSON) -> Void in
        var tweets = [Tweet]()
        
        for tweet in json.arrayValue {
          tweets.append(Tweet(json: tweet))
        }
        
        onComplete(tweets)
    })
  }
  
  class func getMentions(onComplete: ([Tweet]) -> Void) {
    call(
      "GET",
      endpoint: "https://api.twitter.com/1.1/statuses/mentions_timeline.json",
      parameters: [:],
      onData: { (json: JSON) -> Void in
        var tweets = [Tweet]()
        
        for tweet in json.arrayValue {
          tweets.append(Tweet(json: tweet))
        }
        
        onComplete(tweets)
    })
  }
  
  class func getHomeTimeline(onComplete: ([Tweet]) -> Void) {
    call(
      "GET",
      endpoint: "https://api.twitter.com/1.1/statuses/home_timeline.json",
      parameters: [:],
      onData: { (json: JSON) -> Void in
        var tweets = [Tweet]()
        
        for tweet in json.arrayValue {
          tweets.append(Tweet(json: tweet))
        }
        
        onComplete(tweets)
    })
  }
  
  class func getUserTimeline(onComplete: ([Tweet]) -> Void) {
    call(
      "GET",
      endpoint: "https://api.twitter.com/1.1/statuses/user_timeline.json",
      parameters: [:],
      onData: { (json: JSON) -> Void in
        var tweets = [Tweet]()
        
        for tweet in json.arrayValue {
          tweets.append(Tweet(json: tweet))
        }
        
        onComplete(tweets)
    })
  }
  
  private class func call(method: String, endpoint: String, parameters: [NSObject: AnyObject], onData: (JSON) -> Void) {
    var error: NSError?
    
    let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod(method, URL: endpoint, parameters: parameters, error: &error)
    
    if let error = error {
      println("Error happend \(error)")
    } else {
      Twitter.sharedInstance().APIClient.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
        if (connectionError == nil) {
          if let data = data {
            let json = JSON(data: data)
            onData(json)
          }
        }
        else {
          println("Error: \(connectionError)")
        }
      }
    }
  }
}