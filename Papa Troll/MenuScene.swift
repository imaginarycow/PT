//
//  MenuScene.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    let backButton = SKSpriteNode(imageNamed: "backButton.png")
    var levelNumber: SKLabelNode!
    var levelLabel: SKLabelNode!
    let downArrow = SKSpriteNode(imageNamed: "downArrow.png")
    let upArrow = SKSpriteNode(imageNamed: "downArrow.png")
    let removeAdsPic = SKSpriteNode(imageNamed: "removeAds.png")
    var removeAdsPrice = SKLabelNode()
    var shareLabel = SKLabelNode()
    let faceBook = SKSpriteNode(imageNamed: "facebook.png")
    let twitter = SKSpriteNode(imageNamed: "twitter.png")
    
    override func didMove(to view: SKView) {
        
        activeScene = self
        setTitle(title: "Menu", currScene: self, color: customOrange)
        setButtons()
        backgroundColor = .white
    }
    
    func setButtons() {
        
        let buttonSize = scale * 60.0
        let fSize: CGFloat = 16.0 * scale
        
        levelLabel = newLabel(title: "Level", size: fSize)
        levelLabel.position = CGPoint(x: self.size.width * 0.33, y: self.size.height * 0.7)
        addChild(levelLabel)
        
        levelNumber = newLabel(title: String(level), size: fSize)
        levelNumber.position = CGPoint(x: self.size.width * 0.66, y: levelLabel.position.y)
        addChild(levelNumber)
        
        downArrow.zPosition = 3
        downArrow.size = CGSize(width: 30.0 * scale, height: 30.0 * scale)
        downArrow.position = CGPoint(x: levelNumber.position.x - (downArrow.size.width * 1.2), y: levelNumber.position.y)
        addChild(downArrow)
        
        upArrow.zPosition = 3
        upArrow.zRotation = DegToRad(180.0)
        upArrow.size = CGSize(width: 30.0 * scale, height: 30.0 * scale)
        upArrow.position = CGPoint(x: levelNumber.position.x  + (downArrow.size.width * 1.2), y: levelNumber.position.y)
        addChild(upArrow)
        
        removeAdsPic.zPosition = 3
        removeAdsPic.position = CGPoint(x: self.size.width * 0.33, y: self.size.height * 0.5)
        removeAdsPic.size = CGSize(width: buttonSize, height: buttonSize)
        addChild(removeAdsPic)
        
        removeAdsPrice = newLabel(title: "$ 0.99", size: fSize)
        removeAdsPrice.position = CGPoint(x: self.size.width * 0.66, y: removeAdsPic.position.y - (fSize/2))
        addChild(removeAdsPrice)
        
        shareLabel = newLabel(title: "Save the trolls!", size: fSize)
        shareLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.3)
        addChild(shareLabel)
        
        faceBook.size = CGSize(width: buttonSize, height: buttonSize)
        faceBook.zPosition = 3
        faceBook.position = CGPoint(x: self.size.width * 0.33, y: self.size.height * 0.2)
        addChild(faceBook)
        
        twitter.size = CGSize(width: buttonSize, height: buttonSize)
        twitter.zPosition = 3
        twitter.position = CGPoint(x: self.size.width * 0.66, y: self.size.height * 0.2)
        addChild(twitter)
        
        backButton.zPosition = 1
        backButton.size = CGSize(width: 50.0 * scale, height: 50.0 * scale)
        backButton.position = CGPoint(x: 0.0 + (backButton.size.width * 0.6), y: 0.0 + (backButton.size.height * 0.6))
        addChild(backButton)
        
    }
    
    func changeLevel(direction: String) {
        
        switch direction {
        case "up":
            level += 1
        case "down":
            level -= 1
        default:
            level += 1
        }
        
        if level > numbLevels {
            level = 1
        }
        if level < 1 {
            level = numbLevels
        }
        
        levelNumber.text = String(level)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first as UITouch! {
            let location = touch.location(in: self)
            
            if upArrow.contains(location) {
                changeLevel(direction: "up")
                upArrow.alpha = 0.5
            }
            
            if downArrow.contains(location) {
                changeLevel(direction: "down")
                downArrow.alpha = 0.5
            }
            
            if removeAdsPic.contains(location) {
                
            }
            
            if faceBook.contains(location) {
                
            }
            
            if twitter.contains(location) {
                
            }
            
            if backButton.contains(location) {
                //go back to main scene
                moveToScene(scene: .main)
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        upArrow.alpha = 1.0
        downArrow.alpha = 1.0
    }

    
}
