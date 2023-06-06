//
//  DetailesInvoicesCell.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 9/8/2024.
//

import UIKit

class DetailesInvoicesCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var ImageProduct: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantityProduct: UILabel!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var toalPrice: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func configure(with model: CartProductEntity?) {
        var quantity = model?.quntity ?? 0
        var price = model?.price ?? 0.0
        var totalePrice = Double(quantity) * price
        if let productName =  model?.name{
            self.nameProduct.text = productName
        }
         self.quantityProduct.text = "\(String(describing: model?.quntity ?? 0))  "
         if let productPrice = model?.price {
            self.price.text = "\(productPrice)"
        }
        self.toalPrice.text = "\(totalePrice)"
        
        guard let url = URL(string: model?.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.ImageProduct.image = image
            }
        }
    }
}
