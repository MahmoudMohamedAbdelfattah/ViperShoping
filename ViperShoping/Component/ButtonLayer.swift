//
//  ExtentionButtonLayerBorder.swift
//  ViperShoping
//
//  Created by Mahmoud on 05/07/2023.
//

import UIKit

 

class ButtonLayer: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
 
       
    }
}
 
  
