//
//  CartCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 03/10/2024.
//

import UIKit
 class CartCell: UITableViewCell {
    
    // MARK: - Variables
    @IBOutlet weak var cartImageProduct: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var toalPrice: UILabel!
    @IBOutlet weak var totalQuantity: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        cartImageProduct.layer.cornerRadius = 4
        cartImageProduct.layer.borderWidth = 2
        cartImageProduct.layer.borderColor = UIColor.orange.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
 
    func configure(with model: Invoice?) {
        self.toalPrice.text = "\(String(describing: model?.totalPrice ?? 0))"
        self.totalQuantity.text = "\(String(describing: model?.totalQuantity ?? 0))  "
        self.date.text = model?.date

    }
}
