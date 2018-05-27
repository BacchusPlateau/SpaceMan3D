//
//  Collectable.swift
//  SuperSpaceman3D
//
//  Created by Bret Williams on 5/27/18.
//  Copyright © 2018 Bret Williams. All rights reserved.
//

import Foundation
import SceneKit

class Collectable {
    
    class func pyramidNode() -> SCNNode {
        
        let pyramid = SCNPyramid(width: 3.0, height: 6.0, length: 3.0)
        let pyramidNode = SCNNode(geometry: pyramid)
        let position = SCNVector3Make(30, 0, -40)
        
        pyramidNode.position = position
        pyramidNode.name = "pyramid"
        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramidNode.geometry?.firstMaterial?.shininess = 1.0
        
        return pyramidNode
        
    }
    
    class func sphereNode() -> SCNNode {
        
        let sphere = SCNSphere(radius: 6.0)
        let sphereNode = SCNNode(geometry: sphere)
        let position = SCNVector3Make(35, 0, -60)
        
        sphereNode.name = "sphere"
        sphereNode.position = position
        sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        sphereNode.geometry?.firstMaterial?.shininess = 1.0
        
        return sphereNode
        
    }
    
}
