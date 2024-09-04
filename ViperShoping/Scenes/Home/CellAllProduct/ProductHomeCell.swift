//
//  ProductHomeCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 17/07/2024.
//

import UIKit

class ProductHomeCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var labelProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
     // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
     override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }
    
    func configure(with model: AllProducts?) {
        self.labelProduct.text = model?.name
        guard let url = URL(string: model?.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.imageProduct.image = image
             }
        }
     }
}
