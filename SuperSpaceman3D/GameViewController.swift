//
//  GameViewController.swift
//  SuperSpaceman3D
//
//  Created by Bret Williams on 5/27/18.
//  Copyright © 2018 Bret Williams. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var mainScene : SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mainScene = createMainScene()
        mainScene!.rootNode.addChildNode(createFloorNode())
        //mainScene!.rootNode.addChildNode(Collectable.pyramidNode())
        mainScene!.rootNode.addChildNode(Collectable.sphereNode())
        
        let sceneView = self.view as! SCNView
        sceneView.scene = mainScene
        
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        
    }
    
    func createMainScene() -> SCNScene {
        
        let mainScene = SCNScene(named: "art.scnassets/hero.dae")
        return mainScene!
        
    }
    
    func createFloorNode() -> SCNNode {
        
        let floorNode = SCNNode()
        floorNode.geometry = SCNFloor()
        floorNode.geometry?.firstMaterial?.diffuse.contents = "floor"
        
        return floorNode
        
    }

}
