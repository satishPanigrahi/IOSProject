//
//  LoginViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-21.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userEmailTextFiled: UITextField!
    @IBOutlet var userPasswordTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        let userEmail = userEmailTextFiled.text
        let userPassword = userPasswordTextFiled.text
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if (userEmail == userEmailStored){
            
            if (userPassword == userPasswordStored){
                
                // login is successfull
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedin")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else{
                // display: incorrect password
                displayMyAlertMsg("Incorrect password")
                return;
            }
            
        }
        else{
            // display: incorrect email id
            displayMyAlertMsg("Incorrect email-id")
            return;
        }
    }
    
    func displayMyAlertMsg(UserMsg:String){
        let myAlert = UIAlertController(title: "Alert", message: UserMsg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
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
