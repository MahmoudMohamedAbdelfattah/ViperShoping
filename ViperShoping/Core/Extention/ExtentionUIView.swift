//
//  ExtentionUIView.swift
//  ViperShoping
//
//  Created by Mahmoud on 30/06/2024.
//

import UIKit
extension UIView{

      func addViewBorder(borderColor:CGColor,borderWith:CGFloat,borderCornerRadius:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = borderCornerRadius
        self.clipsToBounds = true     }
}


