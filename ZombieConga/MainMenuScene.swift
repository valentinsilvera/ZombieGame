//
//  MainMenuScene.swift
//  ZombieConga
//
//  Created by Valentin Silvera on 08/03/2020.
//  Copyright © 2020 Valentin Silvera. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    let startLabel = SKLabelNode(fontNamed: "AvenirNextCondensed-BoldItalic")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "MainMenu")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
        
        startLabel.text = "Touch anywhere to start the game!"
        startLabel.fontColor = SKColor.black
        startLabel.fontSize = 100
        startLabel.zPosition = 150
        startLabel.horizontalAlignmentMode = .center
        startLabel.verticalAlignmentMode = .center
        startLabel.position = CGPoint(x: size.width/2, y: size.height/2 + size.height/4)
        addChild(startLabel)

    }
    
    func sceneTapped() {
      let myScene = GameScene(size: size)
      myScene.scaleMode = scaleMode
      let reveal = SKTransition.doorway(withDuration: 1.5)
      view?.presentScene(myScene, transition: reveal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
      sceneTapped()
    }
}
