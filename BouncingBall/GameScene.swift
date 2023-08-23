//
//  GameScene.swift
//  BouncingBall
//
//  Created by Francisco Miranda Soares on 22/08/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {

        /// A palavra que vai quicar na tela
        let word = SKLabelNode(text: "DVD")
        word.fontSize = 40
        word.fontName = "Arial Bold Italic"

        /// Bolha protetora ao redor da palavra. Lida com a física
        let bubble = SKShapeNode(circleOfRadius: 65.0)
        bubble.position = .zero
        bubble.strokeColor = .clear

        bubble.addChild(word)

        // Baseado em verificar um exemplo no arquivo sks.
        // Zero intenções de ser preciso
        word.position = CGPoint(x: -0.5, y: -12.5)

        self.bubblePhysics(of: bubble)

        self.setBouncyBoundaries()

        // Pontapé inicial da animação
        self.addChild(bubble)

        bubble.physicsBody?.applyImpulse(CGVector(dx: 7, dy: 10))
    }

    /// Configura a física da bolha para ser quicante
    func bubblePhysics(of bubble: SKShapeNode) {

        bubble.physicsBody = SKPhysicsBody(circleOfRadius: bubble.frame.width/2)

        bubble.physicsBody?.mass = 0.01
        bubble.physicsBody?.restitution = 0.0
        bubble.physicsBody?.friction = 0.0
        bubble.physicsBody?.isDynamic = true
        bubble.physicsBody?.affectedByGravity = false
        bubble.physicsBody?.allowsRotation = false
        bubble.physicsBody?.angularDamping = 0.0
        bubble.physicsBody?.linearDamping = 0.0
    }

    // Configura física do mundo para ter bordas quicantes
    func setBouncyBoundaries() {
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)

        self.physicsBody?.mass = 100
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.friction = 0.0
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.angularDamping = 0.0
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.isResting = true
    }
}
