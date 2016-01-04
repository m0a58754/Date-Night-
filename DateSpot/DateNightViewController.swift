//
//  HomeViewController.swift
//  DateSpot
//
//  Created by Mahmood on 12/31/15.
//  Copyright © 2015 Mahmood. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseFacebookUtilsV4

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findLocation()   
       // let draggableBackground: DraggableViewBackground = DraggableViewBackground(frame: self.view.frame)
       // self.view.addSubview(draggableBackground)
        //does not return anything
   }
    
    func findLocation() {
            PFGeoPoint.geoPointForCurrentLocationInBackground {
                (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
                
                if error == nil {
                    // Succeeding in getting current location
                    NSLog("Got current location successfully")
                    PFUser.currentUser()!.setValue(geoPoint, forKey: "location")
                    PFUser.currentUser()!.saveInBackground()
               
            }
                func addPerson(urlString: String) {
                    
                    
                }
        }
    }
}