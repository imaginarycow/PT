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
    let cliff = SKSpriteNode(imageNamed: "cliff.png")
    
    override func didMove(to view: SKView) {

        activeScene = self
        setScale()
        setTitle(title: "Papa Troll", currScene: self, color: customPurple)
        setButtons()
        setBackground()
        backgroundColor = .white
        checkForNewInstall()
        setTroll()
    }
    
    func setTroll() {
        
        let newTroll = Trolls.new(imageName: "monster1.png")
        newTroll.position = CGPoint(x: 0.0 + newTroll.size.width/2, y: cliff.position.y + (cliff.size.height/2) + newTroll.size.height/2)
        addChild(newTroll)
        
        delay(2.0, closure: {
        
            newTroll.physicsBody?.applyForce(CGVector(dx: 500.0, dy: 0.0))
        })
    }
    
    func setBackground() {
        
        let ground = SKSpriteNode(imageNamed: "ground.png")
        ground.size = CGSize(width: self.size.width, height: 100.0)
        ground.zPosition = 2
        ground.position = CGPoint(x: self.size.width/2, y: 0.0 + ground.size.height/2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ground.size.width, height: ground.size.height))
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.isDynamic = false
        addChild(ground)
        
        let sky = SKSpriteNode(imageNamed: "sky.png")
        sky.zPosition = 1
        sky.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //addChild(sky)
        
        let cliffSize:CGFloat = 100.0 * scale
        
        cliff.size = CGSize(width: cliffSize, height: cliffSize * 2)
        cliff.zPosition = 2
        cliff.position = CGPoint(x: 0.0 + cliff.size.width/2, y: self.size.height * 0.5)
        cliff.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "cliff.png"), size: CGSize(width: cliff.size.width, height: cliff.size.height))
        cliff.physicsBody?.affectedByGravity = false
        cliff.physicsBody?.isDynamic = false
        addChild(cliff)
        
        
    }
    
    func setButtons() {
        
        let buttonSize = scale * 70.0
        
        playButton.zPosition = 5
        playButton.size = CGSize(width: buttonSize, height: buttonSize)
        playButton.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.5)
        playButton.physicsBody = SKPhysicsBody(circleOfRadius: buttonSize/2)
        playButton.physicsBody?.affectedByGravity = false
        playButton.physicsBody?.isDynamic = false
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
