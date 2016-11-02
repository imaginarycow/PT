//
//  GlobalData.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import Foundation
import SpriteKit

let trollFont = "PhantomFingers"

//setup local storage
let gameData = UserDefaults.standard

//screen height and width of user's device
var screenHeight:CGFloat = 0.0
var screenWidth:CGFloat = 0.0
var scale:CGFloat = 0.0

let customBlue = UIColor(red: 58/255, green: 120/255, blue: 192/255, alpha: 1.0)
let customOrange = UIColor(red: 255/255, green: 166/255, blue: 0/255, alpha: 1.0)
let customPurple = UIColor(red: 176/255, green: 52/255, blue: 198/255, alpha: 1.0)
let customGreen = UIColor(red: 73/255, green: 175/255, blue: 93/255, alpha: 1.0)

var level = 1
var highLevel = 1
let numbLevels = 10

func getHighLevel() {
    if gameHasRun {
        highLevel = gameData.integer(forKey: "highLevel")
    }
}
//set new high level
func setHighLevel (lvl: Int) {
    
    if lvl > highLevel {
        gameData.set(lvl, forKey: "highLevel")
        highLevel = lvl
    }
}

//bool and function for initial run
var gameHasRun = false

//set initial install configurations
func checkForNewInstall() {
    
    gameHasRun = gameData.bool(forKey: "gameHasRun")
    
    if gameHasRun == false {
        //send new install log to firebass
        
        //set gameHasRun to true
        gameHasRun = true
        gameData.set(true, forKey: "gameHasRun")
    }
    else {
        highLevel = gameData.integer(forKey: "highLevel")
    }
    
}





















