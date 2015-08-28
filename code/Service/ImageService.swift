//
//  ImageService.swift
//  TswiftDeck
//
//  Created by Ciprian Caba on 28/08/15.
//  Copyright (c) 2015 Ciprian Caba. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
  static var cache: [String: UIImage] = [:]
  
  class func getImage(url: String) -> UIImage? {
    if let image = cache[url] {
      return image
    } else {
      if let nsurl = NSURL(string: url) {
        if let data = NSData(contentsOfURL: nsurl){
          if let image = UIImage(data: data) {
            cache[url] = image
            return image
          }
        }
      }
    }
    
    return nil
  }
}