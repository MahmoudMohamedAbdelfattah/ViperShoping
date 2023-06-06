//
//  UpdateAddressViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 24/8/2024.
//

import UIKit
import SceneKit

class UpdateAddressViewController: UIViewController , UpdateAddressViewProtocol {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainStackView: UIView!
    @IBOutlet var allStsck: [UIStackView]!
    @IBOutlet weak var nameGoverment: UILabel!
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var addressDeatials: UILabel!
    @IBOutlet weak var nameCity: UILabel!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    // MARK: - Properties
    var presenter: UpdateAddressPresenterProtocol?
    var scnView: SCNView!
    var scene: SCNScene!
    var earthNode: SCNNode!
 
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSCNView()
        setupScene()
        setupCamera()
        setupEarth()
        addRotationAnimation()
        presenter?.PostdidLoadData()
        mainStackView.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 2, borderCornerRadius: 20)
        setupBackGroundAllStack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.logoImage)
        }
    }
    
    func setupBackGroundAllStack() {
        _ = allStsck.map{
             $0.backgroundColor = .clear
         }
    }
    
    private func setupSCNView() {
        scnView = SCNView(frame: animationView.bounds)
        scnView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scnView.backgroundColor = UIColor.clear
        self.animationView.addSubview(scnView)

        // إضافة قيود (Constraints) لتحديث حجم SCNView عند تغيير حجم animationView
        NSLayoutConstraint.activate([
            scnView.topAnchor.constraint(equalTo: animationView.topAnchor),
            scnView.bottomAnchor.constraint(equalTo: animationView.bottomAnchor),
            scnView.leadingAnchor.constraint(equalTo: animationView.leadingAnchor),
            scnView.trailingAnchor.constraint(equalTo: animationView.trailingAnchor)
        ])
    }

    private func setupScene() {
        scene = SCNScene()
        scnView.scene = scene
        scnView.autoenablesDefaultLighting = true
      //  scnView.allowsCameraControl = true
    }

    private func setupCamera() {
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 8) // Adjust this value if needed
        scene.rootNode.addChildNode(cameraNode)
        
    }

    private func setupEarth() {
        let earthGeometry = SCNSphere(radius: 1.0) // Adjust radius if needed
        let earthMaterial = SCNMaterial()

        if let image = UIImage(named: "WhatsApp Image 2024-08-27 at 9.20.07 PM") {
            earthMaterial.diffuse.contents = image
            earthMaterial.diffuse.wrapS = .repeat
            earthMaterial.diffuse.wrapT = .repeat
            earthMaterial.diffuse.magnificationFilter = .linear
            earthMaterial.diffuse.minificationFilter = .linear
        } else {
            print("Error: Image '1.jpg' not found.")
        }

        earthGeometry.materials = [earthMaterial]
        earthNode = SCNNode(geometry: earthGeometry)
        scene.rootNode.addChildNode(earthNode)
        earthNode.scale = SCNVector3(x: 3, y: 3, z: 3) // Adjust scale if needed
    }

    private func addRotationAnimation() {
            let rotation = CABasicAnimation(keyPath: "rotation")
            rotation.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
            rotation.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float.pi * 2))
            rotation.duration = 10
            rotation.repeatCount = .greatestFiniteMagnitude
            earthNode.addAnimation(rotation, forKey: "rotation")
    }
 
    func data(name: String, city: String, region: String, details: String) {
        
        print(name)
        print(city)
        print(region)
        print(details)
        self.nameCity.text = region
        self.nameCountry.text = name
        self.nameGoverment.text = city
        self.addressDeatials.text = details
    }
    
    // MARK: - @IBAction
    @IBAction func bckButton(_ sender: UIButton) {
        presenter?.dismissView()
    }
    
}
 
