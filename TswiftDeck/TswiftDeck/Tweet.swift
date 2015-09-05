//
//  Tweet.swift
//  TswiftDeck
//
//  Created by Ciprian Caba on 28/08/15.
//  Copyright (c) 2015 Ciprian Caba. All rights reserved.
//

import Foundation
import SwiftyJSON

class Tweet: Data {
  var id: String {
    get {
      return json["id_str"].stringValue
    }
  }
  
  var text: String {
    get {
      return json["text"].stringValue
    }
  }
  
  var user: User {
    get {
      return User(json: json["user"])
    }
  }
}