//
//  SecondViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-17.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func buttonAdd(sender: AnyObject) {
        //self.performSegueWithIdentifier("showWelcome", sender: self)
        tabBarController?.selectedIndex = 0
    }
    @IBAction func buttonReset(sender: AnyObject) {
        //NSUserDefaults.standardUserDefaults().removeObjectForKey(userDataKey)
        //self.performSegueWithIdentifier("showWelcome", sender: self)
       //tabBarController?.viewWillAppear(true)
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

