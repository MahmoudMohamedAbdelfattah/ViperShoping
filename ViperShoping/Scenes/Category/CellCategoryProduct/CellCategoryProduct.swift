//
//  CellCategoryProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/07/2024.
//

import UIKit

class CellCategoryProduct: UICollectionViewCell {

    
 // MARK: - IBOutlets
    @IBOutlet weak var labelProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
  // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    func configure(with model: DataInfo?) {
        self.labelProduct.text = model?.name
        guard let url = URL(string: model?.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.imageProduct.image = image
             }
        }
     }
}
