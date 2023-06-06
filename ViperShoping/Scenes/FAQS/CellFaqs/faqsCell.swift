//
//  faqsCell.swift
//  ViperShoping
//
//  Created by Mahmoud on 23/07/2023.
//

import UIKit

class faqsCell: UITableViewCell {

// MARK: - IBOutlets
    @IBOutlet weak var answerLbl: UILabel!
    @IBOutlet weak var questionlbl: UILabel!
    
// MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
     }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      }
    
    func configure(with model: ALLData?) {
        self.questionlbl.text = model?.question
        self.answerLbl.text = model?.answer
      }
 }
