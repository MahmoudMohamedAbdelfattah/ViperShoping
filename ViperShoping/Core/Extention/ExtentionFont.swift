//
//  ExtentionFont.swift
//  ViperShoping
//
//  Created by Mahmoud on 03/09/2023.
//

import Foundation
import UIKit


//extension UIFont {
//
//    static func cairoBold() -> UIFont? {
//        return UIFont(name: "Cairo-Bold", size: 16)
//     }
//
//    static func cairoMedium() -> UIFont? {
//        return UIFont(name: "Cairo-Medium", size: 16)
//     }
//
//    static func cairoRegular() -> UIFont? {
//        return UIFont(name: "Cairo-Regular", size: 16)
//     }
//
//    static func cairoSemiBold() -> UIFont? {
//        return UIFont(name: "Cairo-SemiBold", size: 16)
//     }
//}



extension UIFont {
    static func setDefaultFont(size: CGFloat) {
         let fontNameCairoBold = "Cairo-Bold"
//        let fontName_CairoMedium = "Cairo-Medium"
//        let fontName_CairoRegular = "Cairo-Regular"
//        let fontName_CairoSemiBold = "Cairo-SemiBold"

        let font = UIFont(name: fontNameCairoBold, size: size)!
        // Cairo-Light.ttf
        let fontName_CairoBold = UIFont(name: "Cairo-Bold", size: size)!
        let fontName_CairoMedium = UIFont(name: "Cairo-Medium", size: size)!
        let fontName_CairoRegular = UIFont(name: "Cairo-Regular", size: size)!
        let fontName_CairoSemiBold = UIFont(name: "Cairo-SemiBold", size: size)!
        let fontName_CairoLight = UIFont(name: "Cairo-Light", size: size)!
        let attributes = [NSAttributedString.Key.font: font]
    
        
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UINavigationBar.appearance().titleTextAttributes = attributes
    //    UITextField.appearance().defaultTextAttributes = attributes
    
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
 
               
        UITabBar.appearance().tintColor = UIColor.yellow
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.7)
     //   UITabBarItem.appearance().image?.size(setDefaultFont(size:  font))
        
    //   UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
      //  UITabBarItem.appearance().imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)

//        DispatchQueue.main.async {
//            // أعد ضبط الحواف الداخلية لصورة عنصر شريط التبويب
//            let label = tabBarItem.value(forKey: "view") as? UIView
//            label?.subviews.first?.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
//        }
//
        UITextField.appearance().font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = fontName_CairoLight
       
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white]
          UITextField.appearance().defaultTextAttributes = placeholderAttributes
      //  UITextField.appearance().attributedPlaceholder.font =
      //    UITextField.appearance().attributedPlaceholder = NSAttributedString(
           // string: "aa", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
 
        UITextField.appearance(whenContainedInInstancesOf: [UIStackView.self]).font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UIViewController.self]).font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UIView.self]).font = fontName_CairoLight
        UITextField.appearance(whenContainedInInstancesOf: [UIScrollView.self]).font = fontName_CairoLight
 
        UILabel.appearance().font = fontName_CairoSemiBold
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).font = fontName_CairoSemiBold
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = fontName_CairoSemiBold
        UILabel.appearance(whenContainedInInstancesOf: [UIStackView.self]).font = fontName_CairoSemiBold
        UILabel.appearance(whenContainedInInstancesOf: [UIViewController.self]).font = fontName_CairoSemiBold
       
        UIButton.appearance().titleLabel?.font = UIFont.systemFont(ofSize: size)
        UIButton.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).titleLabel?.font = fontName_CairoBold
        UIButton.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).titleLabel?.font = fontName_CairoBold
        UIButton.appearance(whenContainedInInstancesOf: [UIStackView.self]).titleLabel?.font = fontName_CairoBold
        UIButton.appearance(whenContainedInInstancesOf: [UIViewController.self]).titleLabel?.font = fontName_CairoBold
      
        UIButton.appearance(whenContainedInInstancesOf: [UIScrollView.self]).titleLabel?.font = fontName_CairoBold
        UIButton.appearance(whenContainedInInstancesOf: [UIView.self]).titleLabel?.font = fontName_CairoBold
     
        let button : UIButton = UIButton.appearance()
        button.titleLabelFont = fontName_CairoBold
       
        UICollectionView.appearance().backgroundColor = .white
        UICollectionView.appearance().backgroundView?.backgroundColor = .white
        UICollectionViewCell.appearance().backgroundColor = .white
        UIStackView.appearance().backgroundColor = .white
        // Add any other classes you want to modify the font for.
        
       }
static func applyFont(to view: UIView, font: UIFont) {
    if let button = view as? UIButton {
        button.titleLabel?.font = font
        button.setTitleColor(.black, for: .normal)
        }
    for subview in view.subviews {
        applyFont(to: subview, font: font)
        }
    }
}
