//
//  User.swift
//  WeightWatch
//
//  Created by Satish Chandra Panigrahi on 2016-03-17.
//  Copyright © 2016 Satish Chandra Panigrahi. All rights reserved.
//

import UIKit

// Define keys
let userDataKey = "userData"
let userUnitsKey = "userUnits"
let metricUnits = "MetricUnits"
let empericalUnits = "EmpericalUnits"
let userAgeKey = "userAge"
let userHeightKey = "userHeight"
let userWeightKey = "userWeight"
let userGoalKey = "userGoal"
let userTimeKey  = "userTime"
//=======

class User: NSObject {
    // variables
    var age: Int!
    var height: Float!
    var weight: Float!
    var units: String!
    var BMI: Float!
    var goal: Float!
    var time: Int!
    var hasLoaded = false
    //==========
    
    // Singleton: Alaways access the current user
    
    class var currentUser: User
        {
            struct Static {
                static var instance: User?
            }
            if Static.instance == nil{
                if let load: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey(userDataKey){
                    Static.instance = User(data: load as! [String: AnyObject]) // Shows error without Initilizations of user object
                }
                else{
                    Static.instance = User()
                }
            }
            return Static.instance!
    }
    
    // Initilize user object
    
    init(data: [String: AnyObject]) {
        super.init()
        age = data[userAgeKey] as! Int
        height = data[userHeightKey] as! Float
        weight = data[userWeightKey] as! Float
        units = data[userUnitsKey] as! String
        self.calculateBMI()
        goal = data[userGoalKey] as! Float
        time = data[userTimeKey] as! Int
        hasLoaded = true
        
    }
    
    // initialize without any parameter
    override init() {
        super.init()
        
        age = 0
        height = 0
        weight = 0
        units = ""
        BMI = 0
        goal = 0
        time = 0
    }
    
    // BMI calculation
    //metricUnits: Kilogram for weights and meters for weight
    //empericalUnits: pound for weight and feet for height
    func calculateBMI(){
        if units == metricUnits{
            self.BMI = weight/(height * height)
        }
        else if units == empericalUnits{
            let denominator = (height - (height % 1)) * 12 + (height % 1) // (height % 1) represents decimal part
            self.BMI = (weight * 703) / (denominator * denominator)
        }
    }
    
    // To save User data
    func saveUser(){
        var data: [String: AnyObject] = ["": 0]
        data[userAgeKey] = age
        data[userHeightKey] = height
        data[userWeightKey] = weight
        data[userUnitsKey] = units
        data[userGoalKey] = goal
        data[userTimeKey] = time
        
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: userDataKey)

    }
    
    
}
