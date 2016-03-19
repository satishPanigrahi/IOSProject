//
//  FirstViewController.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-17.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var labelUnits: UILabel!
    @IBOutlet var labelcurrentWeight: UILabel!
    @IBOutlet var Photo: UIImageView!
    @IBOutlet weak var labelBMI: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelBMI.text = "Current BMI: \(Float(User.currentUser.BMI))"
        self.Photo.image = UIImage(named: "imageBMI.png")
        //unitsControl.addTarget(self, action: "unitsChanged:", forControlEvents: .ValueChanged)
        self.labelcurrentWeight.text = "Your current weight is: \(Float(User.currentUser.weight))"
        self.labelUnits.text = User.currentUser.units
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

