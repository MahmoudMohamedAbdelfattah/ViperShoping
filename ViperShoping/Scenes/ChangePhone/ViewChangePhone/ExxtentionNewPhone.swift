//
//  ExxtentionNewPhone.swift
//  ViperShoping
//
//  Created by Mahmoud on 14/09/2023.
//

import UIKit

extension  NewPhoneViewController :  UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return serialNumberPhone.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return serialNumberPhone[row]
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberLbl.text = self.serialNumberPhone[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let color = (row == pickerView.selectedRow(inComponent: component)) ? UIColor.green : UIColor.black

        return NSAttributedString(string: serialNumberPhone[row], attributes: [NSAttributedString.Key.backgroundColor : UIColor.white])
    }
}
