//
//  MainScene.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class MainScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "playButton.png")
    let menuButton = SKSpriteNode(imageNamed: "menuButton.png")
    
    override func didMove(to view: SKView) {

        activeScene = self
        setScale()
        setTitle(title: "Papa Troll", currScene: self, color: customOrange)
        setButtons()
        setBackground()
        checkForNewInstall()
    }
    
    func setBackground() {
        
        let sky = SKSpriteNode(imageNamed: "sky.png")
        sky.zPosition = 1
        sky.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        addChild(sky)
        
        let road = SKSpriteNode(imageNamed: "road.png")
        road.zPosition = 2
        road.size = CGSize(width: road.size.width, height: 100.0)
        road.position = CGPoint(x: self.size.width/2, y: 0.0 + (road.size.height/2))
        addChild(road)
        
        let bldg1 = SKSpriteNode(imageNamed: "bldg1.png")
        bldg1.zPosition = 2
        bldg1.anchorPoint = CGPoint(x: activeScene.anchorPoint.x, y: activeScene.anchorPoint.y)
        bldg1.size = CGSize(width: self.size.width * 0.7, height: self.size.height * 0.8)
        bldg1.position = CGPoint(x: self.size.width/2 - (bldg1.size.width/2), y: 0.0 + road.size.height)
        addChild(bldg1)
        
        
    }
    
    func setButtons() {
        
        let buttonSize = scale * 70.0
        
        playButton.zPosition = 5
        playButton.size = CGSize(width: buttonSize, height: buttonSize)
        playButton.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.5)
        addChild(playButton)
        
        menuButton.zPosition = 5
        menuButton.size = CGSize(width: buttonSize, height: buttonSize)
        menuButton.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.3)
        addChild(menuButton)
    }

    
    func setScale() {
        
        screenWidth = (scene?.size.width)!
        screenHeight = (scene?.size.height)!
        print("screen width: \(screenWidth), height: \(screenHeight)")
        
        switch screenHeight {
        case 568:
            scale = 1.0
        case 667:
            scale = 1.17
        case 736:
            scale = 1.29
        case 1024:
            scale = 1.75
        case 1366:
            scale = 2.4
        default:
            scale = 1.0
        }
        print("scale: \(scale)")
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first as UITouch! {
            let location = touch.location(in: self)
            
            if menuButton.contains(location) {
                //go to menu scene
                moveToScene(scene: .menu)
            }
            
            if playButton.contains(location) {
                moveToScene(scene: .game)
            }
        }
        
        
    }

    
}
