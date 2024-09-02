//
//  SlidMenuViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/08/2023.
//
 
import UIKit
 class SlidMenuViewController: UIViewController , SlidMenuViewProtocol {
 
// MARK: - IBOutlets
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var widthMainView: NSLayoutConstraint!
    @IBOutlet weak var imageSlidMenu: UIImageView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var slidView: UIView!
    @IBOutlet weak var viewAnimation: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var personalImageStack: UIStackView!
    
// MARK: - Properties
    var presenter: SlidMenuPresenterProtocol?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.width.constant = 0
        presenter?.getInfo(token: Component.shared.getApiToken() ?? "" )
        setupBackgoundStack()
     }
    
    func setupBackgoundStack() {
        _ = allStack.map{$0.backgroundColor = .clear}
    }
 
    override func viewDidAppear(_ animated: Bool) {
 
         UIView.animate(withDuration: 0.3, animations: { [weak self] in
             guard let self = self else { return }
              if  UIDevice.current.userInterfaceIdiom == .pad{
                 self.width.constant  = 400
              } else {
                 self.width.constant  = 200
              }
             self.view.layoutIfNeeded()
            })
      }

    override func viewDidLayoutSubviews()  {
        super.viewDidLayoutSubviews()
        profileImage.layer.borderWidth = 3
     //   profilImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.systemOrange.cgColor
        profileImage.layer.cornerRadius = self.profileImage.frame.size.height/2
        profileImage.clipsToBounds = true
        uiTapGesture()
    }
    
    func  uiTapGesture() {
        let tapGesturDecreser = UITapGestureRecognizer(target: self, action: #selector(imageTappedDecrese))
            imageSlidMenu.isUserInteractionEnabled = true
            imageSlidMenu.addGestureRecognizer(tapGesturDecreser)
     }
    
    @objc func imageTappedDecrese() {
        self.profileImage.alpha = 0
        self.imageSlidMenu.alpha = 0
        self.stack.alpha = 0
        self.nameLbl.alpha = 0
 
         UIView.animate(withDuration: 0.25, animations: { [weak self] in
                guard let self = self else { return  }
                self.width?.constant = 0
                self.view.layoutIfNeeded()
        }, completion: {[weak self] _ in
            guard let self = self else { return }
                self.view.layoutIfNeeded()
                self.dismiss(animated: true)
        })
       }
    
    func updateProfileImage(image: String , name:String) {
        guard let url = URL(string: image) else { return }
         ImageLoader.shared.loadImage(from: url) {  [weak self] image in
             guard let self = self else { return }
            DispatchQueue.main.async {
                self.profileImage.image = image
                self.nameLbl.text = name
             }
        }
    }
    
// MARK: - Acition
    @IBAction func FavoriteButton(_ sender: UIButton) {
           presenter?.routeToView(view: FavoriteProductWireFrame.assembleModule())
     }
    
    @IBAction func account(_ sender: UIButton) {
         presenter?.routeToView(view: AccountWireFrame.assembleModule())
     }
    
    @IBAction func cartProduct(_ sender: Any) {
        presenter?.routeToView(view: CartProductWireFrame.assembleModule())
    }
     
    @IBAction func termsButton(_ sender: Any) {
        presenter?.routeToView(view: TermsWireFram.assembleModule())
    }
    
}
 
