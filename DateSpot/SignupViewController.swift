//
//  SignupViewController.swift
//  DateSpot
//
//  Created by Mahmood on 12/31/15.
//  Copyright © 2015 Mahmood. All rights reserved.
//

import Foundation
import UIKit
import ParseFacebookUtilsV4
import FBSDKCoreKit
import FBSDKLoginKit


class SignupViewController: UIViewController {
 

    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var profilepic: UIImageView!
    @IBAction func signUp(sender: AnyObject) {
      
    var user = PFUser.currentUser()
     
        if genderSwitch.on {
            user!["interestedIn"] = "female"
        }else{
            user!["interestedIn"] = "male"
        }
    
        user?.saveInBackground()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var user = PFUser.currentUser()
        profilepic.layer.cornerRadius = profilepic.frame.size.width / 2
        profilepic.clipsToBounds = true
        profilepic.layer.masksToBounds = false
       //profilepic.layer.borderColor = UIColor.whiteColor().CGColor// Make image borders rounded

       
        returnUserData()
    
    }

        func returnUserProfileImage(accessToken: NSString)
        {
            let userID = accessToken as NSString
            let facebookProfileUrl = NSURL(string: "http://graph.facebook.com/\(userID)/picture?type=large")
            
            if let data = NSData(contentsOfURL: facebookProfileUrl!) {
                profilepic.image = UIImage(data: data)
            }
            
        }
        
        func returnUserData()
            
        {
            var user = PFUser.currentUser()
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if ((error) != nil)
                {
                    // Process error
                    print("Error: \(error)")
                }
                else
                {
                
                    print("fetched user: \(result)")
                 
                    if let id = result.valueForKey("id") as? NSString {
                        print("ID is: \(id)")
                        self.returnUserProfileImage(id)
                                      
                        
                    } else {
                        print("ID es null")
                    }
                    
                    
                }
            })
            
            
        }
    func circularProfilePic() {
        
    }
    
}