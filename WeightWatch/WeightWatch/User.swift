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
                    Static.instance = User(data: load as [String: AnyObject])
                }
                else{
                    Static.instance = User()
                }
            }
            return Static.instance!
    }
    
// Initilize user object
    
}
