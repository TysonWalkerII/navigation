//
//  AnimationScene.swift
//  gameexample
//
//  Created by Jordan Barconey on 5/16/23.
//

import SpriteKit
import GameplayKit
import SwiftUI

class AnimationScene: SKScene {
    var `guard` = SKSpriteNode()
    
    var guardAtlas = SKTextureAtlas()
    var guardArray = [SKTexture]()
    
    override func didMove(to view: SKView) {
        
        guardAtlas = SKTextureAtlas(named: "guard")
        
        
        for i in 1...guardAtlas.textureNames.count {
            
            let name = "dance_\(i).png"
            guardArray.append(SKTexture(imageNamed: name))
        }
        
        `guard` = SKSpriteNode(imageNamed: "dance_1")
        `guard`.position = CGPoint(x:275, y:275)
        
        addChild(`guard`)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        `guard`.run(SKAction.repeatForever(SKAction.animate(with: guardArray, timePerFrame: 0.1)))
    }
}

struct SKContentView: View {
    var scene: SKScene {
        let scene = AnimationScene()
        scene.size = CGSize(width:500, height: 500)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 600, height: 600)
            .edgesIgnoringSafeArea(.all)
    }
}

struct AnimationScene_Previews: PreviewProvider {
    static var previews: some View {
        SKContentView()
    }
}
