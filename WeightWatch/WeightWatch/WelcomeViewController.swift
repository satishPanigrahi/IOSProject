//
//  WelcomeViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-18.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //Creat outlet
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightgoalField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var unitsControl: UISegmentedControl!
    @IBOutlet weak var hoursSlider: UISlider!
    @IBOutlet weak var hoursOutput: UILabel!
    @IBAction func finishPressed(sender: UIBarButtonItem) {
        
        var conversionFail = false
        
        if let age = Int(ageField.text!){
            User.currentUser.age = age
        }
        else{
            conversionFail = true
        }
        
        if (heightField.text! as NSString).floatValue != 0.0{
            User.currentUser.height = (heightField.text! as NSString).floatValue
        }
        else{
            conversionFail = true
        }
        
        if (weightField.text! as NSString).floatValue != 0.0{
            User.currentUser.weight = (weightField.text! as NSString).floatValue
        }
        else{
            conversionFail = true
        }
        if (weightgoalField.text! as NSString).floatValue != 0.0{
            User.currentUser.goal = (weightgoalField.text! as NSString).floatValue
        }
        else{
            conversionFail = true
        }
        if unitsControl.selectedSegmentIndex == 0{
            User.currentUser.units = empericalUnits
        }
        else{
            User.currentUser.units = metricUnits
        }
        
        User.currentUser.time = Int(hoursSlider.value)
        
        // save and dismiss welcome view
        if !conversionFail{
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
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
           let alert = UIAlertView(title: "Error", message: "You must input correct information into the text fields", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
        }
        
        //update BMI
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Dispaly slider vlaue in the label
        hoursSlider.addTarget(self, action: "sliderChanged:", forControlEvents: .ValueChanged)
        hoursOutput.text = "6 available hours per day"
        
        // Appropriate value of place holder bases on units unitsChanged
        unitsControl.addTarget(self, action: "unitsChanged:", forControlEvents: .ValueChanged)
        
        self.unitsChanged(unitsControl)
        
    }
    // added: Satish // TODO for IOS 9
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Slide)
        
    }
    
    // added:Satish // TODO: for IOS 9
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Slide)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.]
    }
    
    func sliderChanged(sender: UISlider){
        self.hoursOutput.text = "\(Int(sender.value)) available hours per day"
    }
    
    
    func unitsChanged(sender: UISegmentedControl){
//        heightField.text = ""
//        weightField.text = ""
//        weightgoalField.text = ""
        
        if sender.selectedSegmentIndex == 0 // Emperical
        {
            heightField.placeholder = "Height (feet)"
            weightField.placeholder = "Weight (pounds)"
            weightgoalField.placeholder = "Weight Gola (pounds)"
        }
        else // Metric
        {
            heightField.placeholder = "Height (meters)"
            weightField.placeholder = "Weight (kg)"
            weightgoalField.placeholder = "Weight Gola (kg)"
        }
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
