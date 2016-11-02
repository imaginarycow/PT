//
//  GameScene.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let backButton = SKSpriteNode(imageNamed: "backButton.png")
    var levelLabel = SKLabelNode()
    var trollCount = SKLabelNode()
    
    override func didMove(to view: SKView) {
    
        activeScene = self
        backgroundColor = .white
        setButtons()
        setHUD()
        
    }
    
    func setHUD() {
        
        levelLabel = newLabel(title: "Level: \(level)", size: 12.0 * scale)
        levelLabel.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.92)
        addChild(levelLabel)
        
        trollCount = newLabel(title: "Trolls: \(trollsRemaining)", size: 12.0 * scale)
        trollCount.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.92)
        addChild(trollCount)
    }
    
    func setButtons() {

        backButton.zPosition = 1
        backButton.size = CGSize(width: 50.0 * scale, height: 50.0 * scale)
        backButton.position = CGPoint(x: 0.0 + (backButton.size.width * 0.6), y: 0.0 + (backButton.size.height * 0.6))
        addChild(backButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first as UITouch! {
            let location = touch.location(in: self)
            
            
            if backButton.contains(location) {
                moveToScene(scene: .main)
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
