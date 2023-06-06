//
//  SubCategoryViewCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/09/2023.
//

import UIKit
import Kingfisher

class SubCategoryViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model:String) {
         guard let url = URL(string: model ) else { return }
        ImageLoader.shared.loadImage(from: url) { image in
            DispatchQueue.main.async {
                self.imageBanner.image = image
            }
        }
    }
 }
 
