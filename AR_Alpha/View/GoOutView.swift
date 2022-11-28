//
//  GoOutView.swift
//  AR_Alpha
//
//  Created by ryo on 2022/11/28.
//

import ARKit
import SceneKit
import UIKit

class GoOutView: UIViewController , ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    
    var catArray = [SCNNode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/cat.scn")!
        
        sceneView.autoenablesDefaultLighting = true
        
        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.frameSemantics.insert(.personSegmentationWithDepth)
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                addCat(atLocation: hitResult)
            }
        }
    }
    
    func addCat( atLocation location:ARHitTestResult) {
        // Create a new scene
        let position = location.worldTransform
        let catScene = SCNScene(named: "art.scnassets/cat.scn")!
        if let catNode = catScene.rootNode.childNode(withName: "rig", recursively: true) {
            
            catNode.position = SCNVector3(
                x: position.columns.3.x,
                y: position.columns.3.y,
                z: position.columns.3.z)
            catArray.append(catNode)
            
            sceneView.scene.rootNode.addChildNode(catNode)
        }
    }
    
}
