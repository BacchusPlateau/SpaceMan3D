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
    var spotLight : SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mainScene = createMainScene()
        createMainCamera()
        setupLighting(scene: mainScene)
        
        mainScene!.rootNode.addChildNode(createFloorNode())
        mainScene!.rootNode.addChildNode(Collectable.pyramidNode())
        mainScene!.rootNode.addChildNode(Collectable.sphereNode())
        mainScene!.rootNode.addChildNode(Collectable.boxNode())
        mainScene!.rootNode.addChildNode(Collectable.tubeNode())
        mainScene!.rootNode.addChildNode(Collectable.cylinderNode())
        mainScene!.rootNode.addChildNode(Collectable.torusNode())
        
        let sceneView = self.view as! SCNView
        sceneView.scene = mainScene
        
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        
    }
    
    func setupLighting(scene: SCNScene) {
        
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light!.type = SCNLight.LightType.ambient
        ambientLight.light!.color = UIColor.white
        scene.rootNode.addChildNode(ambientLight)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLight.LightType.spot
        lightNode.light!.castsShadow = true
        lightNode.light!.color = UIColor(white: 0.8, alpha: 1.0)
        lightNode.position = SCNVector3Make(0, 80, 30)
        lightNode.rotation = SCNVector4Make(1, 0, 0, Float(-Double.pi / 2.8))
        lightNode.light!.spotInnerAngle = 0
        lightNode.light!.spotOuterAngle = 50
        lightNode.light!.shadowColor = UIColor.black
        lightNode.light!.zFar = 500
        lightNode.light!.zNear = 50
        scene.rootNode.addChildNode(lightNode)
       
    }
    
    func createMainCamera() {
        
        let cameraNode = SCNNode()
        cameraNode.name = "mainCamera"
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 1000
        cameraNode.position = SCNVector3(x: 0, y: 15, z: 10)
        cameraNode.rotation = SCNVector4(x: 0, y: 0, z: 0, w: -Float.pi/4 * 0.5) //Float(-M_PI_4*0.75))
        
        let heroNode = mainScene.rootNode.childNode(withName: "hero", recursively: true)
        heroNode?.addChildNode(cameraNode)
        
        //        mainScene.rootNode.addChildNode(cameraNode)
    }
    
    func createHeroCamera() {
        
        let cameraNode = mainScene.rootNode.childNode(withName: "mainCamera", recursively: true)
        
        cameraNode?.camera?.zFar = 500
        cameraNode?.position = SCNVector3(x: 50, y: 0, z: -20)
        cameraNode?.rotation = SCNVector4(x: 0, y: 0, z: 0, w: Float.pi / 4 * 0.5)
        cameraNode?.eulerAngles = SCNVector3(x: -70, y: 0, z: 0)
   
        let heroNode = mainScene.rootNode.childNode(withName: "hero", recursively: true)
        heroNode?.addChildNode(cameraNode!)
        mainScene.rootNode.childNode(withName: "hero", recursively: true)?.addChildNode(cameraNode!)
        
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
