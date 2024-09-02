//
//  componentNavigate.swift
//  ViperShoping
//
//  Created by Mahmoud on 22/06/2023.
//

import UIKit
import LocalAuthentication


class Component {

// MARK: - Variables
    static let shared = Component()
    private let gradient = CAGradientLayer()

// MARK: - Functions
 
    // MARK: - Give Date"

      func getCurrentShortDate() -> String {
        var todaysDate = NSDate()
        var dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd-MM-yyyy"
        var DateInFormat = dateFormatter.string(from: todaysDate as Date)

         return DateInFormat
     }
    
    // MARK: - Go To Another View "Push"
    func pushView(fromView : UIViewController , toView : UIViewController){
        fromView.navigationController?.pushViewController(toView, animated: true)
     }
     // MARK:- Go To Another View "Present"
    func  PresentView(fromView:UIViewController,toView:UIViewController ){
           let newViwe = toView
           newViwe.modalPresentationStyle = .fullScreen
           fromView.present(newViwe, animated: true)
        }
    // MARK:-  Animation Logo

    func basicAnimations(Image : UIImageView) {
        let light = UIColor.black.cgColor
        let alpha = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3).cgColor
            gradient.frame = CGRect(x: -Image.bounds.size.width, y: 0, width: 6 * Image.bounds.size.width, height: 6 * Image.bounds.size.height)
            gradient.colors = [alpha, light, alpha]
            gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1,y: 0.5)
            gradient.locations = [0 , 0.5, 1]
            Image.layer.mask = gradient
      
               let animation = CABasicAnimation(keyPath: "locations")
               animation.fromValue = [0.0, 0.1, 0.2]
               animation.toValue = [0.9, 0.9,1.0]
               animation.duration = 1.2
               animation.repeatCount = Float.infinity
               gradient.add(animation, forKey: "shimmer")
    }
    

    
    func getApiToken()-> String? {
          let def = UserDefaults.standard
          return def.object(forKey: "api_token") as? String
    }
    
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?

        // تحقق مما إذا كان الجهاز يدعم Face ID أو Touch ID
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            let reason = "يرجى التحقق باستخدام Face ID أو رمز المرور"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // التحقق نجح
                        print("تم التحقق بنجاح!")
                        
                        // انتقل إلى الشاشة التالية أو نفذ ما تريد بعد التحقق
                    } else {
                        self.authenticateUser()
                        // التحقق فشل
                        print("فشل التحقق: \(authenticationError?.localizedDescription ?? "لم يتم تحديد السبب")")
                        // يمكنك معالجة الأخطاء هنا، مثل إعلام المستخدم أو السماح بمحاولة أخرى
                    }
                }
            }
        } else {
            // لا يدعم الجهاز Face ID أو Touch ID
            print("الجهاز لا يدعم Face ID أو Touch ID")
            // يمكن أن تتعامل مع الحالة هنا، مثل تقديم خيارات أخرى للمصادقة أو إخبار المستخدم
        }
    }
}


extension UINavigationController {

    func backToViewController(viewController: Swift.AnyClass) {

            for element in viewControllers as Array {
                if element.isKind(of: viewController) {
                    self.popToViewController(element, animated: true)
                break
            }
        }
    }
}
