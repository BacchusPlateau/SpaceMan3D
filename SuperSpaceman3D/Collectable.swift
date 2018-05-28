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
        let position = SCNVector3Make(0, 0, 200)
        
        pyramidNode.position = position
        pyramidNode.name = "pyramid"
        pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        pyramidNode.geometry?.firstMaterial?.shininess = 1.0
        
        return pyramidNode
        
    }
    
    class func sphereNode() -> SCNNode {
        
        let sphere = SCNSphere(radius: 6.0)
        let sphereNode = SCNNode(geometry: sphere)
        let position = SCNVector3Make(0, 6, -200)
        
        sphereNode.name = "sphere"
        sphereNode.position = position
        sphereNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "earthDiffuse")
        sphereNode.geometry?.firstMaterial?.ambient.contents = #imageLiteral(resourceName: "earthAmbient")
        sphereNode.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "earthSpecular")
        sphereNode.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "earthNormal")
        sphereNode.geometry?.firstMaterial?.diffuse.mipFilter = SCNFilterMode.linear
        sphereNode.geometry?.firstMaterial?.shininess = 1.0
        
        return sphereNode
        
    }
    
    class func cylinderNode() -> SCNNode {
        
        let cylinder = SCNCylinder(radius: 3, height: 8)
        let cylinderNode = SCNNode(geometry: cylinder)
        let position = SCNVector3Make(300, 8, 300)
        
        cylinderNode.name = "cylinder"
        cylinderNode.position = position
        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        cylinderNode.geometry?.firstMaterial?.shininess = 1.0
        
        return cylinderNode
        
    }
    
    class func torusNode() -> SCNNode {
        
        let torus = SCNTorus(ringRadius: 7, pipeRadius: 2)
        let torusNode = SCNNode(geometry: torus)
        let position = SCNVector3Make(-300, 0, 300)
        
        torusNode.name = "torus"
        torusNode.position = position
        torusNode.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        torusNode.geometry?.firstMaterial?.shininess = 1.0
        
        return torusNode
        
    }
    
    class func tubeNode() -> SCNNode {
        
        let tube = SCNTube(innerRadius: 1, outerRadius: 1.5, height: 2)
        let tubeNode = SCNNode(geometry: tube)
        let position = SCNVector3Make(-200, 1.5, 0)
        
        tubeNode.position = position
        tubeNode.name = "tube"
        tubeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        tubeNode.geometry?.firstMaterial?.shininess = 1.0
        
        return tubeNode
        
    }
    
    class func boxNode() -> SCNNode {
        
        var materials = [SCNMaterial]()
        let boxImage = "boxSide"
        
        for index in 1...6 {
            
            let material = SCNMaterial()
            material.diffuse.contents = UIImage(named: boxImage + String(index))
            materials.append(material)
            
        }
        
        let box = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0)
        let boxNode = SCNNode(geometry: box)
        let position = SCNVector3Make(200, 3, -0)
        
        boxNode.position = position
        boxNode.name = "box"
        boxNode.geometry?.materials = materials
        
     //   boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
     //   boxNode.geometry?.firstMaterial?.shininess = 1.0
        
        return boxNode
        
    }
    
}
