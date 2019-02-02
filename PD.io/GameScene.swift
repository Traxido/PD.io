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
    var steeringWheel = SKSpriteNode()
    
    var leftLane : CGFloat = CGFloat()
    var centerLane : CGFloat = CGFloat()
    var rightLane : CGFloat = CGFloat()
    
    var medianTimer : Timer? = nil
    
    override func sceneDidLoad() {
        
        leftLane = ((self.frame.width / 3)-60)
        centerLane = self.frame.width / 2
        rightLane = ((self.frame.width / 3)*2) + 60
        
        self.medianTimer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(dropMedianLines), userInfo: nil, repeats: true)
        
        playerCar = SKSpriteNode.init(imageNamed: "plainCar")
        playerCar.size = CGSize(width: 64, height: 64)
        playerCar.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        playerCar.zPosition = 10
        self.addChild(playerCar)
        
        steeringWheel = SKSpriteNode.init(imageNamed: "steeringWheel2")
        steeringWheel.size = CGSize(width: 300, height: 300)
        steeringWheel.position = CGPoint(x: self.frame.width/2, y: 0)
        steeringWheel.zPosition = 10
        self.addChild(steeringWheel)
        
        let medianSolidLineL = SKSpriteNode.init(imageNamed: "medianLine")
        medianSolidLineL.size = CGSize(width: 12, height: self.frame.height + 500)
        medianSolidLineL.position = CGPoint(x: (self.frame.width/3)-120, y: self.frame.height / 2)
        self.addChild(medianSolidLineL)
        
        let medianSolidLineR = SKSpriteNode.init(imageNamed: "medianLine")
        medianSolidLineR.size = CGSize(width: 12, height: self.frame.height + 500)
        medianSolidLineR.position = CGPoint(x: ((self.frame.width/3)*2)+120, y: self.frame.height / 2)
        self.addChild(medianSolidLineR)
    }
    
    @objc func dropMedianLines() {
        let medianLine = SKSpriteNode.init(imageNamed: "medianLine")
        medianLine.size = CGSize(width: 8, height: 16)
        medianLine.position = CGPoint(x: (self.frame.width/3)+10, y: self.frame.height + 50)
        self.addChild(medianLine)
        animateMedianLine(node: medianLine)
        
        let medianLine2 = SKSpriteNode.init(imageNamed: "medianLine")
        medianLine2.size = CGSize(width: 8, height: 16)
        medianLine2.position = CGPoint(x: ((self.frame.width/3)*2)-10, y: self.frame.height + 50)
        self.addChild(medianLine2)
        animateMedianLine(node: medianLine2)
    }
    
    func animateMedianLine(node: SKSpriteNode) {
        node.run(.sequence([.moveTo(y: -50, duration: 1.2),.removeFromParent()]))
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
        for touch in (touches) {
            let location = touch.location(in: self)
            
            let itemSpeed = frame.size.width / 0.5
            
            let moveDifference = CGPoint(x: location.x - playerCar.position.x, y: self.frame.width/2)
            let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
            let moveDuration = distanceToMove / itemSpeed
            playerCar.run(.moveTo(x: location.x, duration: TimeInterval(moveDuration)))
            
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerCar.removeAllActions()
        playerCar.run(.moveTo(x: centerLane, duration: 0.6))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
