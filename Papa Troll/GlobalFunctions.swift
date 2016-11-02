//
//  GlobalFunctions.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var titleLabel1 = SKLabelNode()
var titleLabel2 = SKLabelNode()

func setTitle(title: String, currScene: SKScene, color:UIColor = customPurple, color2: UIColor = customGreen) {
    
    //remove any existing title label
    titleLabel1.removeFromParent()
    titleLabel2.removeFromParent()
    
    //set new title label with shadow
    titleLabel1.text = title
    titleLabel1.fontName = trollFont
    titleLabel1.fontColor = color
    titleLabel1.name = "titleLabel"
    titleLabel1.zPosition = 3
    titleLabel1.position = CGPoint(x: currScene.size.width/2, y: currScene.size.height * 0.90)
    
    currScene.addChild(titleLabel1)
    
    titleLabel2.text = title
    titleLabel2.fontName = trollFont
    titleLabel2.fontColor = color2
    titleLabel2.alpha = 0.6
    titleLabel2.name = "titleLabel"
    titleLabel2.zPosition = 2
    titleLabel2.position = CGPoint(x: currScene.size.width * 0.49, y: currScene.size.height * 0.89)
    
    currScene.addChild(titleLabel2)
}

func newLabel(title: String, size: CGFloat, color:UIColor = customOrange) -> SKLabelNode{
    
    let label = SKLabelNode(text: title)
    label.fontSize = size
    label.fontColor = color
    label.fontName = trollFont
    label.zPosition = 3
    
    return label
}

//set reference to active scene
var activeScene:SKScene!

//types of scenes
enum SceneType {
    case main, game, postGame, menu
}

func moveToScene(scene: SceneType) {
    
    var nextScene:SKScene!
    
    switch scene {
        
    case .main:
        nextScene = MainScene()
    case .menu:
        nextScene = MenuScene()
    case .postGame:
        nextScene = PostGameScene()
    case .game:
        nextScene = GameScene()
    default:
        nextScene = MainScene()
    }
    nextScene.size = activeScene.size
    nextScene.scaleMode = activeScene.scaleMode
    let transition = SKTransition.crossFade(withDuration: 0.6)
    //let transition = SKTransition.fade(withDuration: 1.0)
    activeScene.scene?.view?.presentScene(nextScene, transition: transition)
    
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

//convert degrees to radians
func DegToRad(_ degrees: Double)->CGFloat {
    return CGFloat(degrees * M_PI / 180.0)
}

func getAvailableFonts() {
    
    for family: String in UIFont.familyNames
    {
        print("\(family)")
        for names: String in UIFont.fontNames(forFamilyName: family)
        {
            print("== \(names)")
        }
    }
}
