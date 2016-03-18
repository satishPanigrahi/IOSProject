//
//  TabBarController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-18.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    // Show Welcome page
    override func viewDidAppear(animated: Bool) {
        if User.currentUser.height == 0 && User.currentUser.weight == 0{
            self.performSegueWithIdentifier("showWelcome", sender: self)
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
