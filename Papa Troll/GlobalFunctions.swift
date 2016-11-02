//
//  GlobalFunctions.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit
var titleLabel = SKLabelNode()

func setTitle(title: String, currScene: SKScene, color:UIColor = .white) {
    
    //remove any existing title label
    titleLabel.removeFromParent()
    
    //set new title label
    titleLabel.text = title
    titleLabel.fontName = trollFont
    titleLabel.fontColor = color
    titleLabel.name = "titleLabel"
    titleLabel.zPosition = 3
    titleLabel.position = CGPoint(x: currScene.size.width/2, y: currScene.size.height * 0.90)
    
    currScene.addChild(titleLabel)
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
