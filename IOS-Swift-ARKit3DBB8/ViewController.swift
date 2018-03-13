//
//  ViewController.swift
//  IOS-Swift-ARKit3DBB8
//
//  Created by Pooya Hatami on 2018-03-10.
//  Copyright © 2018 Pooya Hatami. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere =  SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/2k_sun.jpg")
        sphere.materials = [material]
        
        let sphere01 =  SCNSphere(radius: 0.2)
        let material01 = SCNMaterial()
        material01.diffuse.contents = UIImage(named: "art.scnassets/2k_earth_daymap.jpg")
        sphere01.materials = [material01]

        
        let sphere02 =  SCNSphere(radius: 0.2)
        let material02 = SCNMaterial()
        material02.diffuse.contents = UIImage(named: "art.scnassets/2k_mars.jpg")
        sphere02.materials = [material02]

        
        let sphere03 =  SCNSphere(radius: 0.2)
        let material03 = SCNMaterial()
        material03.diffuse.contents = UIImage(named: "art.scnassets/2k_venus_surface.jpg")
        sphere03.materials = [material03]

        
        let sphere04 =  SCNSphere(radius: 0.2)
        let material04 = SCNMaterial()
        material04.diffuse.contents = UIImage(named: "art.scnassets/2k_neptune.jpg")
        sphere04.materials = [material04]

        
        // creating a node object
        
        let node = SCNNode()
        node.position = SCNVector3(x: 0 , y: 0.1 , z: -0.5)

        let node01 = SCNNode()
        node01.position = SCNVector3(x: -0.5 , y: -0.5 , z: -1)

        let node02 = SCNNode()
        node02.position = SCNVector3(x: -1 , y: -1 , z: 2)

        let node03 = SCNNode()
        node03.position = SCNVector3(x: -1.5 , y: -1.5 , z: 0.5)

        let node04 = SCNNode()
        node04.position = SCNVector3(x: 2 , y: 2 , z: 2)

        
        // placing our moon to the postion / node we creat
        
        node.geometry = sphere
        node01.geometry = sphere01
        node02.geometry = sphere02
        node03.geometry = sphere03
        node04.geometry = sphere04

        // adding moon to the scence
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node01)
        sceneView.scene.rootNode.addChildNode(node02)
        sceneView.scene.rootNode.addChildNode(node03)
        sceneView.scene.rootNode.addChildNode(node04)

        // project light on the moon and make it look like a 3d object
        
        sceneView.autoenablesDefaultLighting = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
