//
//  ViewController.swift
//  AR_Alpha
//
//  Created by ryo on 2022/11/28.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let catScene = SCNScene(named: "art.scnassets/cat.scn")
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 1.5)
        catScene?.rootNode.addChildNode(cameraNode)
        
        catScene?.rootNode.scale = SCNVector3(x: 3, y: 3, z: 3)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 1.5)
        catScene?.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        catScene?.rootNode.addChildNode(ambientLightNode)
        
        sceneView.allowsCameraControl = true
        
        sceneView.backgroundColor = UIColor.white
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        sceneView.scene = catScene
    }
    
    
    @IBAction func itemButtonPressed(_ sender: UIButton) {
        let itemView = ItemView()
        itemView.view.backgroundColor = .systemCyan
        if let sheet = itemView.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(itemView, animated: true ,completion: nil)
    }
    
}
