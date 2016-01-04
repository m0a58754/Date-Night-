//
//  ViewController.swift
//  DateSpot
//
//  Created by Mahmood on 12/30/15.
//  Copyright © 2015 Mahmood. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4

let permissions = ["public_profile"]


class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
 
    @IBAction func fbLogin(sender: UIButton) {
        
        self.errorLabel.alpha = 0
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile","email", "friends"], block: { (user:PFUser?, error:NSError?) -> Void in
            
            
                if error == nil {
                    
                    print("login sucessful")
                    //Display an alert message
                    let myAlert = UIAlertController(title:"Alert", message:error?.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert);
                    
                    let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                    
                    myAlert.addAction(okAction);
                    self.presentViewController(myAlert, animated:true, completion:nil);
            
                   
                }else {
                
                    self.errorLabel.alpha = 1.0
                    print("Login was unsucessful. Please Try Again ")
                
              }
            
            print(user)
            print("Current user token=\(FBSDKAccessToken.currentAccessToken().tokenString)")
            
            print("Current user id \(FBSDKAccessToken.currentAccessToken().userID)")
            
            if(FBSDKAccessToken.currentAccessToken() != nil)
            {
                let Homepage = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as?HomeViewController
                
                let protectedPageNav = UINavigationController(rootViewController: Homepage!)
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.window?.rootViewController = protectedPageNav
                
            }
            
        return
            
        
            
    
        })
        
        sender.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

