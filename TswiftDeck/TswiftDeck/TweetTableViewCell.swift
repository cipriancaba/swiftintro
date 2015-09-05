//
//  TweetTableViewCell.swift
//
//
//  Created by Ciprian Caba on 28/08/15.
//
//

import UIKit

class TweetTableViewCell: UITableViewCell {
  
  @IBOutlet var profileImage: UIImageView!
  @IBOutlet var messageLabel: UILabel!
  @IBOutlet var userLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func updateData(tweet: Tweet) {
    profileImage.image = ImageService.getImage(tweet.user.profileImageUrl)
//        profileImage.contentMode = UIViewContentMode.ScaleAspectFit
    
    messageLabel.text = tweet.text
    userLabel.text = "@\(tweet.user.screenName)"
  }
}
