//
//  keyBoard.swift
//  ViperShoping
//
//  Created by Mahmoud on 06/08/2023.
//

import UIKit

class KeyboardManager {
    static let shared = KeyboardManager()
    
    private init() {}
    
    func configureKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        // تنفيذ السلوك المطلوب عند ظهور لوحة المفاتيح هنا
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        // تنفيذ السلوك المطلوب عند إخفاء لوحة المفاتيح هنا
    }
}
