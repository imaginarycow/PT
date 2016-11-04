//
//  GameViewController.swift
//  Papa Troll
//
//  Created by ramiro beltran on 10/31/16.
//  Copyright © 2016 Ramiro Beltran. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    var scene:SKScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene = MainScene()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.isMultipleTouchEnabled = true
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = true
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        //scene.physicsWorld.gravity = CGVector(dx: 0.0,dy: 0.0)
        scene.physicsBody?.affectedByGravity = true
        
        /* Set the scale mode to scale to fit the window */
        scene.size = skView.bounds.size
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
