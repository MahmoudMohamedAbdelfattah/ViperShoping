//
//  extentionLocalizable.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 23/6/2024.
//

import Foundation
import UIKit

//protocol XIBLocalizable {
//    var xibLocKey: String? { get set }
//}

extension UILabel {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}

extension UIButton {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}

extension UITextField {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }
}

 
