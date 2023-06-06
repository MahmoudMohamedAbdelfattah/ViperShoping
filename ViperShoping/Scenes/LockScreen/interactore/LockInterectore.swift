//
//  LockInterectore.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 30/7/2024.
//

import Foundation
import LocalAuthentication
import UIKit



class LockInteractor : LockInteractorInputProtocol {

    
      // MARK: - Variables
    var outPut: LockInteractorOutputProtocol?

    // MARK: - Functions
     func getData() {
         let context = LAContext()
         var error: NSError?

         if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
             
             let reason = "يرجى التحقق باستخدام Face ID أو رمز المرور"
             
             context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                 DispatchQueue.main.async {
                     if success {
                         // التحقق نجح
                         print("تم التحقق بنجاح!")
                         
                         self.outPut?.popView()
            
                     } else {
                         // التحقق فشل
                         print("فشل التحقق: \(authenticationError?.localizedDescription ?? "لم يتم تحديد السبب")")
                         // يمكنك معالجة الأخطاء هنا، مثل إعلام المستخدم أو السماح بمحاولة أخرى
                         print("ffffffffffffffffff")
                    //     self.getData()
                     }
                 }
             }
         } else {
             // لا يدعم الجهاز Face ID أو Touch ID
             print("الجهاز لا يدعم Face ID أو Touch ID")
             print("bbbbbbbbbbb")

          }
     }
    
    }
    
 
