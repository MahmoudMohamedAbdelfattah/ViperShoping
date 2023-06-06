//
//  FavoriteCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/08/2023.
//

import UIKit

class FavoriteCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var favoriteImageProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     }
    
    
    func configure(with model: CategoryDataDetials?) {
        self.nameProduct.text = model?.name
        guard let url = URL(string: model?.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.favoriteImageProduct.image = image
             }
        }
     }
}
