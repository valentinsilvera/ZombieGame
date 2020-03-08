//
//  MathUtilities.swift
//  ZombieConga
//
//  Created by Valentin Silvera on 07/03/2020.
//  Copyright © 2020 Valentin Silvera. All rights reserved.
//

import Foundation
import CoreGraphics
import AVFoundation

func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += (left: inout CGPoint, right: CGPoint) {
  left = left + right
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= (left: inout CGPoint, right: CGPoint) {
  left = left - right
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= (left: inout CGPoint, right: CGPoint) {
  left = left * right
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func *= (point: inout CGPoint, scalar: CGFloat) {
  point = point * scalar
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= ( left: inout CGPoint, right: CGPoint) {
  left = left / right
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func /= (point: inout CGPoint, scalar: CGFloat) {
  point = point / scalar
}

let π = CGFloat.pi

func shortestAngleBetween(angle1: CGFloat,
                          angle2: CGFloat) -> CGFloat {
  let twoπ = π * 2.0
  var angle = (angle2 - angle1)
    .truncatingRemainder(dividingBy: twoπ)
  if angle >= π {
    angle = angle - twoπ
  }
  if angle <= -π {
    angle = angle + twoπ
  }
  return angle
}

extension CGFloat {
  func sign() -> CGFloat {
    return self >= 0.0 ? 1.0 : -1.0
  }
}

extension CGPoint {
  
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint {
    return self / length()
  }
  
  var angle: CGFloat {
    return atan2(y, x)
  }
}

extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UInt32.max))
  }

  static func random(min: CGFloat, max: CGFloat) -> CGFloat {
    assert(min < max)
    return CGFloat.random() * (max - min) + min
  }
}

//music

var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
  let resourceUrl = Bundle.main.url(forResource:
    filename, withExtension: nil)
  guard let url = resourceUrl else {
    print("Could not find file: \(filename)")
    return
  }

  do {
    try backgroundMusicPlayer =
      AVAudioPlayer(contentsOf: url)
    backgroundMusicPlayer.numberOfLoops = -1
    backgroundMusicPlayer.prepareToPlay()
    backgroundMusicPlayer.play()
  } catch {
    print("Could not create audio player!")
    return
  }
}
