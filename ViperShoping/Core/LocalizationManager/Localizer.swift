//
//  Localizer.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/6/2024.
//
 
import Foundation
import UIKit

extension UIApplication {
    class func isRTL() -> Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}

class Localizer: NSObject {

    static var specialKeywords: [String] = []

    static func start() {
         LanguageHandler.setDefaultLanguage(NewLanguage.english)
        swizzleUIMethods()
      //  addSpecialKeywords()
    }

    static func swizzleUIMethods() {
        methodSwizzleGivenClassName(cls: Bundle.self,
                                    originalSelector: #selector(Bundle.localizedString(forKey:value:table:)),
                                    overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))
        
        methodSwizzleGivenClassName(cls: UIApplication.self,
                                    originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection),
                                    overrideSelector: #selector(getter: UIApplication.customUserInterfaceLayoutDirection))
        
        methodSwizzleGivenClassName(cls: UITextField.self,
                                    originalSelector: #selector(UITextField.layoutSubviews),
                                    overrideSelector: #selector(UITextField.cstmlayoutSubviews))
        
        methodSwizzleGivenClassName(cls: UILabel.self,
                                    originalSelector: #selector(UILabel.layoutSubviews),
                                    overrideSelector: #selector(UILabel.cstmlayoutSubviews))
        
        methodSwizzleGivenClassName(cls: UIButton.self,
                                    originalSelector: #selector(UIButton.layoutSubviews),
                                    overrideSelector: #selector(UIButton.cstmlayoutSubviews))
  
    }

    static func addSpecialKeywords() {
        self.specialKeywords = ["Back", "Done"]
    }

    static func setSemanticContentAttribute(direction: UISemanticContentAttribute) {
        UIView.appearance().semanticContentAttribute = direction
        UICollectionView.appearance().semanticContentAttribute = direction
        UIButton.appearance().semanticContentAttribute = direction
         UIImage(named: "arrow")?.imageFlippedForRightToLeftLayoutDirection()
    }

    static func setLanguageTo(_ language: NewLanguage) {
        LanguageHandler.setLanguage(language)
        setSemanticContentAttribute(direction: language.direction)
    }
}

extension UILabel {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.isKind(of: NSClassFromString("UITextFieldLabel")!) {
            return // handle special case with uitextfields
        }
        if self.tag <= 0 {
            if UIApplication.isRTL() {
                if self.textAlignment == .center { return }
                if self.textAlignment == .right {
                    return
                }
            } else {
                if self.textAlignment == .center { return }
                if self.textAlignment == .left {
                    return
                }
            }
        }
        if self.tag <= 0 {
            if UIApplication.isRTL() {
                self.textAlignment = .right
                
            } else {
                self.textAlignment = .left
            }
        }
    }
}

extension UITextField {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.tag <= 0 {
            if UIApplication.isRTL() {
                if self.textAlignment == .center { return }
                if self.textAlignment == .right { return }
                self.textAlignment = .right
            } else {
                if self.textAlignment == .center { return }
                if self.textAlignment == .left { return }
                self.textAlignment = .left
            }
        }
    }
}

extension UIButton {
    @objc public func cstmlayoutSubviews() {
        self.cstmlayoutSubviews()
        if self.tag <= 0 {
            if UIApplication.isRTL() {
                if self.contentHorizontalAlignment == UIControl.ContentHorizontalAlignment.center  { return }
                if self.contentHorizontalAlignment == UIControl.ContentHorizontalAlignment.right { return }
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
            } else {
                if self.contentHorizontalAlignment == UIControl.ContentHorizontalAlignment.center { return }
                if self.contentHorizontalAlignment == UIControl.ContentHorizontalAlignment.left { return }
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            }
        }
        if self.tag <= 0 {
            if UIApplication.isRTL() {
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
                
            } else {
                self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            }
        }

    }
}

var numberoftimes = 0
extension UIApplication {
    @objc var customUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        return LanguageHandler.currentLanguage().interfaceDirection
    }
}

extension Bundle {
    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        let translate = { (tableName: String?) -> String in
            let currentLanguage = LanguageHandler.currentLanguage()
            var bundle = Bundle.main
            // normal case where the language with locale working
            if let path = Bundle.main.path(forResource: LanguageHandler.currentLanguage().hyphenatedCode, ofType: "lproj") {
                bundle = Bundle(path: path)!
             } else if let path = Bundle.main.path(forResource: currentLanguage.code, ofType: "lproj") {
                bundle = Bundle(path: path)!
             } else {
                let path = Bundle.main.path(forResource: "Base", ofType: "lproj")!
                bundle = Bundle(path: path)!
             }
            return (bundle.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
        if self == Bundle.main {
           return translate(tableName)
        } // if the external frameworks has no locale property so you have to handle switching yourself
        else if Localizer.specialKeywords.contains(key) {
            return translate("Localizable")
        } else {
            return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
    }
}

/// Exchange the implementation of two methods of the same Class
func methodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!
    let overrideMethod: Method = class_getInstanceMethod(cls,overrideSelector)!
    if class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
    } else {
        method_exchangeImplementations(origMethod, overrideMethod)
    }
}
