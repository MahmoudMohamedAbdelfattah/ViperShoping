////
////  fontSize.swift
////  ViperShoping
////
////  Created by Mahmoud on 05/07/2023.
////
//
//import Foundation
//import UIKit
//
//
//class FontSize  {
//    static let standardFontSize: CGFloat = UIFont.systemFontSize
//    
//    static func changeFontSize(for view: UIView, by scaleFactor: CGFloat) {
//        
//        if let label = view as? UILabel {
//            label.font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
//        } else if let button = view as? UIButton {
//            button.titleLabel?.font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
//            
//            //  let angle = CGFloat.pi/4.0
//            
//            // تحديد زاوية اللف وتطبيقها على زر النص
//            //     button.transform = CGAffineTransform(rotationAngle: angle)
//            
//            // تحديد حجم النص بعد اللف باستخدام الخاصية scaleTransform
//            let scaleTransform = CGAffineTransform(scaleX: 1.0/button.transform.a, y: 1.0/button.transform.d)
//            button.titleLabel?.transform = scaleTransform
//            
//            // تحديد حجم الزر بعد اللف باستخدام الخاصية bounds
//            let originalBounds = button.bounds
//            button.bounds = CGRect(x: 0, y: 0, width: originalBounds.height, height: originalBounds.width)
//            
//            // تحديد حجم وموقع النص بعد اللف باستخدام الخاصية center
//            button.titleLabel?.center = CGPoint(x: button.bounds.midX, y: button.bounds.midY)
//            
//            
//            button.titleLabel?.minimumScaleFactor = 0.5 // تعيين أقل حجم يمكن استخدامه لتصغير النص لنسبة 50%
//            button.titleLabel?.adjustsFontSizeToFitWidth = true
//            
//        } else if let textField = view as? UITextField {
//            textField.font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
//        } else if let textView = view as? UITextView {
//            textView.font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
//        }
//        
//        // Recursively change font size for all subviews
//        for subview in view.subviews {
//            changeFontSize(for: subview, by: scaleFactor)
//        }
//    }
//    
// 
//    
//    //   static func increaseFontSize(by scaleFactor: CGFloat) {
//    //        // تحديد نوع الخط الافتراضي
//    //        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
//    //
//    //        // تحديد نوع الخط الجديد بحجم معين
//    //        let newFont = UIFont.systemFont(ofSize: defaultFont.pointSize * scaleFactor)
//    //
//    //        // تعيين الخط الجديد لجميع عناصر النص في التطبيق
//    //        UILabel.appearance().font = newFont
//    //        UITextField.appearance().font = newFont
//    //        UITextView.appearance().font = newFont
//    //        UIButton.appearance().titleLabel?.font = newFont
//    //    }
//    
//    //    static func increaseFontSize(by scaleFactor: CGFloat) {
//    //        // تحديد نوع الخط الافتراضي
//    //        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
//    //
//    //        // تحديد نوع الخط الجديد بحجم معين
//    //        let newFont = UIFont.systemFont(ofSize: defaultFont.pointSize * scaleFactor)
//    //
//    //        // تعيين الخط الجديد لجميع عناصر النص في التطبيق
//    //        UILabel.appearance().subviews.forEach { ($0 as? UILabel)?.font = newFont }
//    //        UITextField.appearance().subviews.forEach { ($0 as? UILabel)?.font = newFont }
//    //        UITextView.appearance().subviews.forEach { ($0 as? UILabel)?.font = newFont }
//    //        UIButton.appearance().subviews.forEach {
//    //            if let label = ($0 as? UIButton)?.titleLabel {
//    //                label.font = newFont
//    //            }
//    //        }
//    //    }
//    
//    //   static func increaseFontSize(by scaleFactor: CGFloat) {
//    //        let fontNames = UIFont.familyNames
//    //        for fontName in fontNames {
//    //            let fontStyles = UIFont.fontNames(forFamilyName: fontName)
//    //            for fontStyle in fontStyles {
//    //                if let font = UIFont(name: fontStyle, size: UIFont.systemFontSize * scaleFactor) {
//    //                    UILabel.appearance().font = font
//    //                    UITextField.appearance().font = font
//    //                    UITextView.appearance().font = font
//    //                    UIButton.appearance().titleLabel?.font = font
//    //                }
//    //            }
//    //        }
//    //    }
//    
//    //   static func increaseFontSize(by scaleFactor: CGFloat) {
//    //        // تحديد نوع الخط الافتراضي
//    //        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
//    //
//    //        // تحديد نوع الخط الجديد بحجم معين
//    //        let newFont = UIFont.systemFont(ofSize: defaultFont.pointSize * scaleFactor)
//    //
//    //        // تعيين الخط الجديد لجميع عناصر النص في التطبيق
//    //        if let labelFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
//    //            let labelAppearance = UILabel.appearance(whenContainedInInstancesOf: [UIView.self])
//    //            labelAppearance.font = labelFont
//    //        }
//    //
//    //        if let textFieldFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
//    //            let textFieldAppearance = UITextField.appearance(whenContainedInInstancesOf: [UIView.self])
//    //            textFieldAppearance.font = textFieldFont
//    //        }
//    //
//    //        if let textViewFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
//    //            let textViewAppearance = UITextView.appearance(whenContainedInInstancesOf: [UIView.self])
//    //            textViewAppearance.font = textViewFont
//    //        }
//    //
//    //        if let buttonFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
//    //            let buttonAppearance = UIButton.appearance(whenContainedInInstancesOf: [UIView.self])
//    //            buttonAppearance.titleLabel?.font = buttonFont
//    //        }
//    //    }
//    //
//    //  static  func increaseFontSize(by scaleFactor: CGFloat) {
//    //        // تحديد نوع الخط الافتراضي
//    //        let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
//    //
//    //        // تحديد نوع الخط الجديد بحجم معين
//    //        let newFont = UIFont.systemFont(ofSize: defaultFont.pointSize * scaleFactor)
//    //
//    //        // تعيين الخط الجديد لجميع عناصر النص في التطبيق
//    //        UILabel.appearance().font = newFont
//    //        UITextField.appearance().font = newFont
//    //        UITextView.appearance().font = newFont
//    //        UIButton.appearance().titleLabel?.font = newFont
//    //    }
//    
//    
//    
////        static  func increaseFontSize(by scaleFactor: CGFloat) {
////            // تحديد نوع الخط الافتراضي
////            let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
////
////            // تحديد نوع الخط الجديد بحجم معين
////            let newFont = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
////
////            // تعيين الخط الجديد لجميع عناصر النص في التطبيق
////            if let labelFont = UIFont(name: newFont.fontName, size: standardFontSize * scaleFactor) {
////                UILabel.appearance().font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
////            }
////
////            if let textFieldFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
////                UITextField.appearance().font = textFieldFont
////            }
////
////            if let textViewFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
////                UITextView.appearance().font = textViewFont
////            }
////
////            if let buttonFont = UIFont(name: newFont.fontName, size: newFont.pointSize) {
////                UIButton.appearance().titleLabel?.font = buttonFont
////            }
////            for subview in view.subviews {
////                increaseFontSize(by: 18)
////            }
////        }
//    
//    
//    
// 
//}
//
//
////extension UIFont {
////    static let standardFontSize: CGFloat = UIFont.systemFontSize
////
////    static func changeFontSizeRecursively(scaleFactor: CGFloat) {
////
////        if let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withSize(standardFontSize * scaleFactor) as? UIFontDescriptor {
////
////            let font = UIFont(descriptor: fontDescriptor, size: 0)
////            let attrs = [NSAttributedString.Key.font: font]
////            UIBarButtonItem.appearance().setTitleTextAttributes(attrs, for: .normal)
////
////            UIButton.appearance().titleLabel?.font = font
////            UILabel.appearance().font = font
////            UITextField.appearance().font = font
////            UITextView.appearance().font = font
////        }
////    }
////}
//
////extension UIFont {
////    static let standardFontSize: CGFloat = UIFont.systemFontSize
////
////    static func changeFontSizeRecursively(scaleFactor: CGFloat) {
////        if let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withSize(standardFontSize * scaleFactor) as? UIFontDescriptor {
////            let font = UIFont(descriptor: fontDescriptor, size: 10)
////            let attrs = [NSAttributedString.Key.font: font]
////            UIBarButtonItem.appearance().setTitleTextAttributes(attrs, for: .normal)
////            UIButton.appearance().titleLabel?.font = font
////
////            if var label = UILabel.appearance().font {
////                label = UIFont.systemFont(ofSize: scaleFactor * standardFontSize)
////            }
////            UILabel.appearance().font = UIFont.systemFont(ofSize: standardFontSize * scaleFactor)
////
////
////            UITextField.appearance().font = font
////            UITextView.appearance().font = font
////        }
////    }
////}
//
////extension UIFont {
////    static let standardFontSize: CGFloat = UIFont.systemFontSize
////
////    static func changeFontSizeRecursively(scaleFactor: CGFloat) {
////        let fontNames = UIFont.familyNames
////        for fontName in fontNames {
////            let fontTypeNames = UIFont.fontNames(forFamilyName: fontName)
////            for fontTypeName in fontTypeNames {
////                if let font = UIFont(name: fontTypeName, size: standardFontSize * scaleFactor) {
////                    let fontDescriptor = font.fontDescriptor
////                    let newDescriptor = fontDescriptor.addingAttributes([.size: font.pointSize])
////                    let newFont = UIFont(descriptor: newDescriptor, size: 0)
////                    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: newFont], for: .normal)
////                    UIButton.appearance().titleLabel?.font = newFont
////                    UILabel.appearance().font = newFont
////                    UITextField.appearance().font = newFont
////                    UITextView.appearance().font = newFont
////                }
////            }
////        }
////    }
////}
////
////extension UIFont {
////    static let standardFontSize: CGFloat = UIFont.systemFontSize
////
////    static func changeFontSizeRecursively(scaleFactor: CGFloat) {
////        let fontNames = UIFont.familyNames
////        for fontName in fontNames {
////            let fontTypeNames = UIFont.fontNames(forFamilyName: fontName)
////            for fontTypeName in fontTypeNames {
////                if let font = UIFont(name: fontTypeName, size: standardFontSize * scaleFactor) {
////                    let fontDescriptor = font.fontDescriptor
////                    let newDescriptor = fontDescriptor.addingAttributes([.size: font.pointSize])
////                    let newFont = UIFont(descriptor: newDescriptor, size: 0)
////                    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: newFont], for: .normal)
////                    UIButton.appearance().titleLabel?.font = newFont
////                    UILabel.appearance().font = newFont
////                    UITextField.appearance().font = newFont
////                    UITextView.appearance().font = newFont
////                }
////            }
////        }
////        
////        if var label = UILabel.appearance().font{
////            //label.systemFont(ofSize: standardFontSize * scaleFactor)
////        }
////    }
////    }
//    
////
////extension UILabel {
////    static func setDefaultFont(size: CGFloat) {
////        let font = UIFont.systemFont(ofSize: size)
////        UILabel.appearance().font = font
////    }
////}
//
//extension UIView {
//    func changeFontSize(scaleFactor: CGFloat) {
//        if let label = self as? UILabel {
//            label.font = label.font.withSize(label.font.pointSize * scaleFactor)
//        } else if let button = self as? UIButton {
//            button.titleLabel?.font = button.titleLabel?.font.withSize((button.titleLabel?.font.pointSize)! * scaleFactor)
//        } else if let textField = self as? UITextField {
//            textField.font = textField.font?.withSize(textField.font!.pointSize * scaleFactor ?? UIFont.systemFontSize)
//        } else if let textView = self as? UITextView {
//            textView.font = textView.font?.withSize(textView.font!.pointSize * scaleFactor ?? UIFont.systemFontSize)
//        }
//        for subview in subviews {
//            subview.changeFontSize(scaleFactor: scaleFactor)
//        }
//    }
//}
//
//
//extension UIView {
//    func changeFontSize(){
//        let fontSize = CGFloat(60)
//        
//        
//        if let v = self as? UIButton {
//            v.titleLabel?.font = v.titleLabel?.font.withSize(fontSize)
//        
//        }
//        
//        
//        
//        else if let v = self as? UILabel {
//            v.font = v.font.withSize(fontSize)
//            
//            
//        }
//        
//        
//        
//        else if let v = self as? UITextField {
//            v.font = v.font?.withSize(fontSize)
//        }
//        
//        
//        else {
//            for view in subviews {
//                view.changeFontSize()
//            }
//        }
//    }
//}
