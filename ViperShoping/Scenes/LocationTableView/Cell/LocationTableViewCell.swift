//
//  LocationTableViewCell.swift
//  ViperShoping
//
//  Created by Mac Book Pro  on 14/7/2024.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var placeDeatial: UILabel!
    @IBOutlet weak var placeName: UILabel!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
