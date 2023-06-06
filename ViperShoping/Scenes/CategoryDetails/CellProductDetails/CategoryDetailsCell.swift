//
//  CategoryDetailsCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 21/07/2023.
//

import UIKit
 
class CategoryDetailsCell: UITableViewCell{
 
    // MARK: - Outlet
        @IBOutlet weak var cartView: UIView!
        @IBOutlet weak var favoriteImage: UIImageView!
        @IBOutlet weak var cartImage: UIImageView!
        @IBOutlet weak var nameLbl: UILabel!
        @IBOutlet weak var oldPriceLbl: UILabel!
        @IBOutlet weak var discountLbl: UILabel!
        @IBOutlet weak var newPriceLbl: UILabel!
        @IBOutlet weak var productImage: UIImageView!
        @IBOutlet weak var decreseQuntity: UIImageView!
        @IBOutlet weak var increseQuntity: UIImageView!
        @IBOutlet weak var quantityLbl: UILabel!
 
    // MARK: - Properties
        weak var delgate: ProductTableViewDelgate?
        var data : CategoryDataDetials?
        var quntity : Int =  1
    
    // MARK: - Methods
  
    override func awakeFromNib() {
        super.awakeFromNib()
             uiTapGesture()
 
          }
 
    func  uiTapGesture() {
        let tapGesturDecreser = UITapGestureRecognizer(target: self, action: #selector(imageTappedDecrese))
        decreseQuntity.isUserInteractionEnabled = true
        decreseQuntity.addGestureRecognizer(tapGesturDecreser)
        let tapGesturIncrese = UITapGestureRecognizer(target: self, action: #selector(imageTappedIncrese))
        increseQuntity.isUserInteractionEnabled = true
        increseQuntity.addGestureRecognizer(tapGesturIncrese)
        let tapGesturFavorite = UITapGestureRecognizer(target: self, action: #selector(imageTappedFavorite))
        favoriteImage.isUserInteractionEnabled = true
        favoriteImage.addGestureRecognizer(tapGesturFavorite)
        let tapGesturCart = UITapGestureRecognizer(target: self, action: #selector(imageTappedCart))
            cartImage.isUserInteractionEnabled = true
            cartImage.addGestureRecognizer(tapGesturCart)
        }
    
    @objc func imageTappedFavorite() {
        let isSelectedFavorite = data?.isFavorite == true ? false : true
        delgate?.reloadFavoriteCell(cell: self, isFavorite: isSelectedFavorite, model: self.data ?? CategoryDataDetials())
 
        }
 
    @objc func imageTappedCart() {
          let isSelectedCart = data?.isCart == true ? false : true
          delgate?.reloadCartCell(cell: self, isCart: isSelectedCart , model: self.data ?? CategoryDataDetials())
          }
    
    @objc func imageTappedDecrese() {
            self.quntity -= 1
         if self.quntity < 1 {
            delgate?.reloadCartCell(cell: self, isCart: false, model: self.data ?? CategoryDataDetials())
            }
        else {
            delgate?.reloadCartQuntityCell(cell: self, quantity: self.quntity, model: self.data ?? CategoryDataDetials())
 
             }
         }
    
    @objc func imageTappedIncrese() {
         self.quntity += 1
        delgate?.reloadCartQuntityCell(cell: self, quantity: self.quntity, model: self.data ?? CategoryDataDetials())
           }
    
  
     func configure(NameModule:CategoryDataDetials) {
        self.data = NameModule
          if NameModule.isFavorite == true {
            favoriteImage.image = UIImage(systemName: "heart.fill")
            favoriteImage.tintColor = UIColor.red
        } else  {
            favoriteImage.image = UIImage(systemName: "heart")
            favoriteImage.tintColor = .black
        }
        if NameModule.isCart == true {
             cartView.isHidden = true
             cartImage.isHidden = true
        } else {
            cartView.isHidden = false
            cartImage.isHidden = false
        }
        productImage.image = UIImage(named: NameModule.image ?? "")
        nameLbl.text = NameModule.name
         
         if let oldPrice =  NameModule.old_price {
             oldPriceLbl.text = "\(oldPrice)"
         }
         if let price =  NameModule.price {
             newPriceLbl.text = "\(price)"
         }
         if let discount =  NameModule.discount {
             discountLbl.text = "\(discount)"
         }
         quantityLbl.text = "\(String(describing: NameModule.quantity ?? 0))  "
         self.quntity = NameModule.quantity  ?? 0
        guard let url = URL(string: NameModule.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.productImage.image = image
                }
            }
       }
  }
