//
//  LoginViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2023.
//

import UIKit
import CoreLocation
 class LoginViewController : UIViewController , LoginViewProtocol{
 
// MARK: - IBOutlets
    @IBOutlet weak var logaImage: UIImageView!
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var showPassword: UIButton!
    
// MARK: - Properties
    var presenter: LoginPresenterProtocol?
    var isHiddenPassword = true
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
        }
    
// MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
      
            setupBackgoundStack()
    }
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)

         DispatchQueue.main.async {
            Component.shared.basicAnimations(Image: self.logaImage)
         }
     }
 
     func setupBackgoundStack() {
         _ = allStack.map{$0.backgroundColor = .clear}
     }
     
     func processLogin(){
        if let email = emailText.text,
           let password = passwordText.text{
            presenter?.signIn(email: email, password: password)
        }
    }
    
// MARK: - Acition
    @IBAction func buttonSignIn(_ sender: UIButton) {
            processLogin()
        }
    
    @IBAction func backButton(_ sender: Any) {
            presenter?.routeToDismiss()
        }
    
    @IBAction func showPassword(_ sender: Any) {
        
        isHiddenPassword.toggle()
           if isHiddenPassword == true {
               passwordText.isSecureTextEntry = true
               showPassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)

        } else {
                passwordText.isSecureTextEntry = false
                showPassword.setImage(UIImage(systemName: "eye"), for: .normal)
           }
        
     }
}
