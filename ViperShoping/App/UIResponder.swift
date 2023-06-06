//
//  UIResponder.swift
//  ViperShoping
//
//  Created by Mahmoud on 06/08/2023.
//

import UIKit

extension UIResponder {
    private weak static var _currentFirstResponder: UIResponder? = nil
    
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    @objc private func findFirstResponder(sender: Any) {
        UIResponder._currentFirstResponder = self
    }
}
