//
//  LanguageManager.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 12/6/2024.
//

import Foundation
import UIKit

import Foundation
import UIKit

// constants
let appleLanguageKey = "AppleLanguages"
private let firstTimeLanguage = "firstTimeLanguage"

/// L102Language
class LanguageHandler {

    class func currentLanguage() -> NewLanguage {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: appleLanguageKey) as! NSArray
        let current = langArray.firstObject as! String
        if let hyphenIndex = current.firstIndex(of: "-") {
              return NewLanguage(rawValue: String(current[..<hyphenIndex])) ?? NewLanguage.english
        }
        return NewLanguage(rawValue: current) ?? NewLanguage.english
     }

    /// set @lang to be the first in Applelanguages list
    class func setLanguage(_ language: NewLanguage) {
        let userdef = UserDefaults.standard
        userdef.set([language.hyphenatedCode, currentLanguage().hyphenatedCode], forKey: appleLanguageKey)
        userdef.synchronize()
    }

    public class func setDefaultLanguage(_ language: NewLanguage) {
        if !UserDefaults.standard.bool(forKey: firstTimeLanguage) {
            LanguageHandler.setLanguage(language)
            UserDefaults.standard.set(true, forKey: firstTimeLanguage)
        }
    }

    class var isArabic: Bool {
        return LanguageHandler.currentLanguage().code == "ar"

    }
}
