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
                         self.outPut?.popView()
                     } else {
                          print("فشل التحقق: \(authenticationError?.localizedDescription ?? "لم يتم تحديد السبب")")
       
                     }
                 }
             }
         } else {
             // لا يدعم الجهاز Face ID أو Touch ID
             print("الجهاز لا يدعم Face ID أو Touch ID")
 
          }
     }
    
    }
    
 
