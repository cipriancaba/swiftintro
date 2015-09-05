//
//  User.swift
//  TswiftDeck
//
//  Created by Ciprian Caba on 28/08/15.
//  Copyright (c) 2015 Ciprian Caba. All rights reserved.
//

import Foundation

class User: Data {
  var name: String {
    get {
      return json["name"].stringValue
    }
  }
  
  var screenName: String {
    get {
      return json["screen_name"].stringValue
    }
  }
  
  var profileImageUrl: String {
    get {
      return json["profile_image_url_https"].stringValue
    }
  }
}