//
//  PostGameScene.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

class PostGameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        activeScene = self
        setTitle(title: "PostGame", currScene: self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first as UITouch! {
            let location = touch.location(in: self)
            
            
        }
    }

}
