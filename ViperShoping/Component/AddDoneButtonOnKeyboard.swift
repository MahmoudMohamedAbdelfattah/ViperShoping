//
//  AddDoneButtonOnKeyboard.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/07/2023.
//

import UIKit


func addDoneButtonOnKeyboard(parentView view: UIView, textField: UITextField )
        {
    let keyboardToolbar = UIToolbar()
    keyboardToolbar.sizeToFit()
    let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
    let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                        target: view, action: #selector(UIView.endEditing(_:)))
    keyboardToolbar.items = [flexBarButton, doneBarButton]
    textField.inputAccessoryView = keyboardToolbar
        }
