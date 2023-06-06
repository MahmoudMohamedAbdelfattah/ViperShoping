 
 
import UIKit
  
class RegisterViewController : UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate , UIGestureRecognizerDelegate {
 
// MARK: - IBOutlets
    @IBOutlet weak var showConfirmPassword: UIButton!
    @IBOutlet weak var ShowPasswordImage: UIButton!
    @IBOutlet var allStack: [UIStackView]!
    @IBOutlet weak var txtfristName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var profilImage: UIImageView!
    
// MARK: - Variables
    var presenter: SignUpViewPresenterProtocol?
    let imagePicker = UIImagePickerController()
    var imagebase : String?
    var isHiddenPassword = true
    var isHiddenConfirmPassword = true
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
// MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgoundStack()
        setupProfileImageGesture()
     }

    override func viewDidLayoutSubviews()  {
        super.viewDidLayoutSubviews()
        
        profilImage.layer.borderWidth = 3
        profilImage.layer.borderColor = UIColor.systemOrange.cgColor
        profilImage.layer.cornerRadius = self.profilImage.frame.size.height/2
        profilImage.clipsToBounds = true
    }
    
    func setupBackgoundStack() {
        _ = allStack.map{$0.backgroundColor = .clear}
    }
    
    func ConvertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    
    func setupProfileImageGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTappedProfile))
        tapGesture.cancelsTouchesInView = false
        profilImage.addGestureRecognizer(tapGesture)
        profilImage.isUserInteractionEnabled = true
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
        profilImage.image = TheImg
        self.imagebase = ConvertImageToBase64String(img: TheImg)
          dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        dismiss(animated: true, completion: nil)
    }
    
    func processSignUp() {
        guard self.imagebase != nil else {
            presenter?.routeHideIndicatorAndShowAlert(eroorMessage: "please choose Your image")
            return
          }
        guard txtPassword.text == txtConfirmPassword.text else {
            presenter?.routeHideIndicatorAndShowAlert(eroorMessage: "password not match confirm password")
            return
        }
        if let fristName = txtfristName.text,
            let lastName = txtlastName.text,
            let phone = txtPhone.text,
            let email = txtemail.text?.trimmend,
            let password = txtPassword.text,
            let confirmPassword = txtConfirmPassword.text{
            presenter?.signUp(fristName: fristName, lastName: lastName, phone: phone, email: email, password: password, confirmPassword: confirmPassword, image: self.imagebase ?? "")
        }
    }
    
  // MARK: - Acition
    @IBAction func signUpPressed(_ sender: UIButton){
 
         self.processSignUp()
       }
    
    @IBAction func ShowPasswordImageButton(_ sender: UIButton) {
         isHiddenPassword.toggle()
            if isHiddenPassword == true {
                txtPassword.isSecureTextEntry = true
                ShowPasswordImage.setImage(UIImage(systemName: "eye.slash"), for: .normal)
         } else {
             txtPassword.isSecureTextEntry = false
             ShowPasswordImage.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
    
    @IBAction func showConfirmPasswordImage(_ sender: UIButton) {
        isHiddenConfirmPassword.toggle()
           if isHiddenConfirmPassword == true {
               txtConfirmPassword.isSecureTextEntry = true
               showConfirmPassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            txtConfirmPassword.isSecureTextEntry = false
            showConfirmPassword.setImage(UIImage(systemName: "eye"), for: .normal)
           }
        }
    }

 
