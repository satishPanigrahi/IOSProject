//
//  RegisterPageViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-21.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var userRepeatPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func RegisterButtonPressed(sender: AnyObject) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = userRepeatPasswordTextField.text
        
        // check for empty field
        
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty){
            //dispaly error msg
            displayMyAlertMsg("All Fileds are required")
            return;
        }
        
        // check for password match
        
        if (userPassword != userRepeatPassword){
            //display error msg
            displayMyAlertMsg("Passwords do not match")
            return;
            
        }
        
        // Store data
        
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        // Dispaly alert msg for confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration Successful, Thank you", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){
            ACTION in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
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
