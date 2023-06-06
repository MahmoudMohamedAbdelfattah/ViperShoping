//
//  GradiantView.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2023.
//

import Foundation

import UIKit

class GradiantColor : UIView {
    
       
    override func draw(_ rect: CGRect) {
        gradiantColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradiantColor()
     }
    
    
    func gradiantColor() {
        let mylayer : CAGradientLayer = CAGradientLayer ()
              mylayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
                                    //  array of color to make rgb call "func - > rgb" use  init
                    let firstcolor = UIColor.init(red: 26/255, green: 36/255, blue: 79/255, alpha: 1).cgColor
                    let secoundColor = UIColor.init(red: 71/255, green: 131/255, blue: 209/255, alpha: 1).cgColor
                                    // when start operation gradient & end
       mylayer.startPoint = CGPoint(x: 0, y: 0.0)
                                    mylayer.endPoint = CGPoint(x: 0, y: 0.7)
                                    mylayer.colors = [firstcolor, secoundColor]
                                    // to add layer befor button
                                    mylayer.zPosition = -2
                                    // to add layer on view
                   layer.addSublayer(mylayer)
    }
 
}
