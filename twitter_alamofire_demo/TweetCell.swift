//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var retweetButtonLabel: UIButton!
    
    @IBOutlet weak var favoriteButtonLabel: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var replyCountLabel: UILabel!
    
    @IBOutlet weak var favoritesCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            dateLabel.text = tweet.createdAtString
            profileNameLabel.text = tweet.user.screenName
            nameLabel.text = tweet.user.name
            //replyCountLabel.text = tweet.reply
            retweetCountLabel.text = "\(tweet.retweetCount)"
            favoritesCountLabel.text =  "\(tweet.favoriteCount ?? 0)"
            profileImageView.af_setImage(withURL: tweet.user.profileImageUrl!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func onFavorites(_ sender: Any) {
        if (tweet.favorited == false) {
            tweet.favorited = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
            favoriteButtonLabel.setImage(UIImage(named: "favor-icon-red"), for: .selected)
        }else if (tweet.favorited == true) {
            self.tweet.favorited = false
            self.tweet.favoriteCount = tweet.favoriteCount! - 1
            favoriteButtonLabel.setImage(UIImage(named: "favor-icon"), for: [])
        }
        refreshData()
        APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
        
        
    }
    
    @IBAction func onReply(_ sender: Any) {
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        if (tweet.retweeted == false) {
            tweet.retweeted = true
            tweet.retweetCount += 1
            // Selected
            retweetButtonLabel.setImage(UIImage(named: "retweet-icon-green"), for: .selected)
            
        }else if (tweet.retweeted == true) {
            self.tweet.retweeted = false
            self.tweet.retweetCount -= 1
             retweetButtonLabel.setImage(UIImage(named: "retweet-icon"), for: [])
            
        }
        refreshData()
        APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error retweeting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully retweeted the following Tweet: \n\(tweet.text)")
            }
        }
    }
    

    
    @IBAction func onMessage(_ sender: Any) {
    }
   
    func refreshData() {
        retweetCountLabel.text = "\(tweet.retweetCount)"
        favoritesCountLabel.text =  "\(tweet.favoriteCount ?? 0)"
    }
}
