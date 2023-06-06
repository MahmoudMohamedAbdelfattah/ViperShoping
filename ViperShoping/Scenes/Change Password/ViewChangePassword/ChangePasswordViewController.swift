//
//  ChangePasswordViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 12/09/2023.
//

import UIKit

class ChangePasswordViewController: UIViewController , ChangePasswordViewProtocol{
   
    // MARK: - IBOutlets
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var changePassword: UIButton!
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var descriptionPasswordlbl: UILabel!
    @IBOutlet weak var StrongView: UIView!
    @IBOutlet weak var goodView: UIView!
    @IBOutlet weak var averageView: UIView!
    @IBOutlet weak var weakView: UIView!
    @IBOutlet weak var strongPasswordLbl: UILabel!
    @IBOutlet weak var descriptionCurrentPasswordLbl: UILabel!
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var currentPasswordView: UIView!
    @IBOutlet weak var currentPasswordTxt: UITextField!
    
    // MARK: - Properties
    var presenter: ChangePasswordPresenterProtocol?
    var holdUp =  "Hold_up_this_field_is_required".localized
    var holdUp6Character = "HoldUp6Character".localized
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordTxt.textContentType = .oneTimeCode
        currentPasswordTxt.textContentType = .oneTimeCode
        currentPasswordTxt.becomeFirstResponder()
        newPasswordTxt.delegate = self
        currentPasswordTxt.delegate = self
        descriptionCurrentPasswordLbl.isHidden = true
        
        _ = allStack.map{
            $0.backgroundColor = .clear
         }
      }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
    
    // MARK: - @IBAction

    @IBAction func changePassword(_ sender: Any) {
        presenter?.postChangePassword(current_password: currentPasswordTxt.text ?? "", new_password: newPasswordTxt.text ?? "", Content_Type: NetworkManager.shared.contentType, lang: LanguageHandler.currentLanguage().rawValue, Authorization: Component.shared.getApiToken() ?? "")
    }
    
    @IBAction func dismiss(_ sender: Any) {
        presenter?.dismiss()
    }
}
