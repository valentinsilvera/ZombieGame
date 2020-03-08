//
//  GameViewController.swift
//  ZombieConga
//
//  Created by Valentin Silvera on 07/03/2020.
//  Copyright © 2020 Valentin Silvera. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let scene =
      GameScene(size:CGSize(width: 2048, height: 1536))
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = false
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
