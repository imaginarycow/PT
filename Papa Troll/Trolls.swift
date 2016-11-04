//
//  Trolls.swift
//  Papa Troll
//
//  Created by ramiro beltran on 11/1/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import SpriteKit

var trollsRemaining = 10
let trollSize = 60.0 * scale

enum Troll {
    case skinny, average, fat
}

class Trolls {
    
    class func new(imageName: String) -> SKSpriteNode{
    
        let troll = SKSpriteNode(imageNamed: imageName)
        troll.size = CGSize(width: trollSize, height: trollSize)
        troll.zPosition = 3
        troll.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: troll.size)
        
        return troll
    }
}
