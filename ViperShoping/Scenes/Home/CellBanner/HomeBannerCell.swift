//
//  HomeBannerCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 08/07/2024.
//

import UIKit

class HomeBannerCell: UICollectionViewCell  {

// MARK: - IBOutlets
    @IBOutlet weak var imageBanner: UIImageView!
    
 // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
     func configure(with model: AllBanners?) {
        guard let url = URL(string: model?.image ?? "" ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.imageBanner.image = image
             }
        }
     }
}
