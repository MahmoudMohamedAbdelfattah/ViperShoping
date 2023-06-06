//
//  AccountViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 11/09/2023.
//

import UIKit

class AccountViewController: UIViewController , AccountViewProtocol {

    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var imageLogo: UIImageView!
    
    // MARK: - Properties
    var presenter: AccountPresenterProtocol?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 2, borderCornerRadius: 20)
        _ = allStack.map{(
            $0.backgroundColor = .clear
        )}
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }

    // MARK: - Acition
     @IBAction func changePassword(_ sender: Any) {
 
        presenter?.routeToView(view: ChangePasswordWireFrame.assembleModule())
    }
    
    @IBAction func dimissView(_ sender: Any) {
        presenter?.routeToDismiss()
    }
    @IBAction func editeInformation(_ sender: Any) {
        presenter?.routeToView(view: PersonalInformationWireFram.assembleModule())
        
    }
    @IBAction func updateAddress(_ sender: Any) {
        presenter?.routeToView(view: UpdateAddressWireFram.assembleModule())

    }
}
