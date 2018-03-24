//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Pranaya Adhikari on 3/23/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: User = User.current!
    
  
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var followersLabel: UILabel!
  
    @IBOutlet weak var tweetsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileNameLabel.text = "@\(user.screenName!)"
        userNameLabel.text = user.name!
        tweetsLabel.text = "\(user.statusesCount!)"
        followersLabel.text = "\(user.followersCount!)"
        followingLabel.text = "\(user.friendsCount!)"
        
        if (user.profileBackgroundImageUrl != nil){
            backdropImageView.af_setImage(withURL: user.backgroundImageUrl!)
        }
        
        if (user.profileImageUrl != nil){
            profileImageView.af_setImage(withURL: user.profileImageUrl!)
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
