//
//  TextLayer.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 7/7/2024.
//

import UIKit

class TextLayer: UITextField {
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
     }
}
