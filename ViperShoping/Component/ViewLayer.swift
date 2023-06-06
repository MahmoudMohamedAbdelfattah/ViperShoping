//
//  ViewLayer.swift
//  ViperShoping
//
//  Created by Mahmoud on 13/07/2023.
//

import UIKit

class ViewLayer: UIView {
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
     }
}
