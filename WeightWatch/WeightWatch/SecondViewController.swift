//
//  SecondViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-17.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var textUpdateHeight: UITextField!
    @IBOutlet var textUpdateWeight: UITextField!
    @IBOutlet var updateUnits: UISegmentedControl!
    
    
    
   
    
    
    @IBAction func buttonAdd(sender: AnyObject) {
        //self.performSegueWithIdentifier("showWelcome", sender: self)
        
        var inputFileds = false
        
        if (textUpdateHeight.text! as NSString).floatValue != 0.0{
            User.currentUser.height = (textUpdateHeight.text! as NSString).floatValue
        }
        else{
            inputFileds = true
        }
        
        if (textUpdateWeight.text! as NSString).floatValue != 0.0{
            User.currentUser.weight = (textUpdateWeight.text! as NSString).floatValue
        }
        else{
            inputFileds = true
        }
        
        if updateUnits.selectedSegmentIndex == 0{
            User.currentUser.units = empericalUnits
        }
        else{
            User.currentUser.units = metricUnits
        }
        
        if !inputFileds{
            // User.currentUser.BMI = Float(User.currentUser.calculateBMI())  // not todo: Why??
            // added to refresh the value at label
            
            if User.currentUser.units == metricUnits{
                User.currentUser.BMI = User.currentUser.weight/(User.currentUser.height * User.currentUser.height)
            }
            else if User.currentUser.units == empericalUnits{
                let denominator = (User.currentUser.height - (User.currentUser.height % 1)) * 12 + (User.currentUser.height % 1)
                User.currentUser.BMI = (User.currentUser.weight * 703) / (denominator * denominator)
            }
            User.currentUser.hasLoaded = true
            User.currentUser.saveUser()
            
            tabBarController?.selectedIndex = 0
        }
        else{
            let alert = UIAlertView(title: "Error", message: "You must input correct information into the text fields", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
        }
        
        
    }
    @IBAction func buttonReset(sender: AnyObject) {
        //NSUserDefaults.standardUserDefaults().removeObjectForKey(userDataKey)
        //self.performSegueWithIdentifier("showWelcome", sender: self)
       //tabBarController?.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateUnits.addTarget(self, action: "unitsChanged1:", forControlEvents: .ValueChanged)
        
        self.unitsChanged1(updateUnits)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func unitsChanged1(sender: UISegmentedControl){
        //        heightField.text = ""
        //        weightField.text = ""
        //        weightgoalField.text = ""
        
        if sender.selectedSegmentIndex == 0 // Emperical
        {
            textUpdateHeight.placeholder = "Height (feet)"
            textUpdateWeight.placeholder = "Weight (pounds)"
            
        }
        else // Metric
        {
           textUpdateHeight.placeholder = "Height (meters)"
           textUpdateWeight.placeholder = "Weight (kg)"
        }
    }

}

