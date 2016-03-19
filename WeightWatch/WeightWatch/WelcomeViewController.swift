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
        
        if !conversionFail{
            User.currentUser.hasLoaded = true
            User.currentUser.saveUser()
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
           let alert = UIAlertView(title: "Error", message: "You must input correct information into the text fields", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hoursSlider.addTarget(self, action: "sliderChanged:", forControlEvents: .ValueChanged)
        hoursOutput.text = "6 hours per day"
        
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
        self.hoursOutput.text = "\(Int(sender.value)) hours per day"
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
