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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
