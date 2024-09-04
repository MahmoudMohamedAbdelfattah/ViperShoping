//
//  PersonalInformationViewController.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 22/8/2024.
//

import UIKit

class PersonalInformationViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate , PersonalInformationViewProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    var imagebase : String?
    var presenter: PersonalInformationPresenterProtocol?

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.PostdidLoadData()
        setupProfileImageGesture()
        setupBackGroundAllStack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         DispatchQueue.main.async {
           Component.shared.basicAnimations(Image: self.imageLogo)
        }
    }
    
    override func viewDidLayoutSubviews()  {
        super.viewDidLayoutSubviews()
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.systemOrange.cgColor
        profileImage.layer.cornerRadius = self.profileImage.frame.size.height/2
        profileImage.clipsToBounds = true
    }
    
    func setupBackGroundAllStack() {
        _ = allStack.map{
             $0.backgroundColor = .clear
         }
    }
    
    func data(name: String, email: String, phone: String, image: String) {
        self.emailTxt.text = email
        self.nameTxt.text = name
        self.phoneTxt.text = phone
        
        guard let url = URL(string: image) else { return }
        ImageLoader.shared.loadImage(from: url) {  [weak self] image in
            guard let self = self else { return }
            
            self.profileImage.image = image
        }
    }
        
        func ConvertImageToBase64String (img: UIImage) -> String {
            let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
            let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
            return imgString
        }
        
        func setupProfileImageGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTappedProfile))
            tapGesture.cancelsTouchesInView = false
            profileImage.addGestureRecognizer(tapGesture)
            profileImage.isUserInteractionEnabled = true
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.sourceType = .camera
        }
 
        @objc func imageTappedProfile() {
            let title = "choose_image".localized
            let source = "source".localized
            let camera = "camera".localized
            let photo = "photo_gallery".localized
            let cancel = "cancel".localized
            
            let alertcon=UIAlertController(title: title , message: source, preferredStyle: .actionSheet)
            
            let cameraAcition = UIAlertAction(title: camera, style:.default) {[weak self] (ـ) in
                self?.imagePicker.sourceType = .camera
                if self != nil{
                    self?.present(self!.imagePicker,animated: true,completion: nil)
                }}
            
            
            let photoAcition=UIAlertAction(title: photo, style:.default) {[weak self] (ـ) in
                self?.imagePicker.sourceType = .photoLibrary
                if self != nil{
                    self?.present(self!.imagePicker,animated: true,completion: nil)
                }}
            let cancelAcition=UIAlertAction(title: cancel, style: .cancel, handler: nil)
            alertcon.addAction(cancelAcition)
            alertcon.addAction(cameraAcition)
            alertcon.addAction(photoAcition)
            present(alertcon,animated: true,completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {
                return
            }
            let TheImg = image
            profileImage.image = TheImg
            self.imagebase = ConvertImageToBase64String(img: TheImg)
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            dismiss(animated: true, completion: nil)
        }
    
    // MARK: - @IBAction
    @IBAction func updateProfile(_ sender: Any) {
        presenter?.updateProfile(name: nameTxt.text ?? "", email: emailTxt.text ?? "", phone: phoneTxt.text ?? "", image: imagebase ?? "" )
    }
}
 
