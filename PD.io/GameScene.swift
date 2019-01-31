//
//  GameScene.swift
//  PD.io
//
//  Created by Andrew Sheron on 1/31/19.
//  Copyright © 2019 Andrew Sheron. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var playerCar = SKSpriteNode()
    
    override func sceneDidLoad() {
        playerCar = SKSpriteNode.init(imageNamed: "sheriff")
        playerCar.size = CGSize(width: 64, height: 64)
        playerCar.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        playerCar.zPosition = 0
        self.addChild(playerCar)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
