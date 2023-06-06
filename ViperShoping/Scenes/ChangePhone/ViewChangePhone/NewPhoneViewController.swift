//
//  NewPhoneViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 14/09/2023.
//

import UIKit

class NewPhoneViewController: UIViewController ,ChangePhoneViewProtocol {
    


    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var stack: UIStackView!
    
    
    var presenter: ChangePhonePresenterProtocol?
 
    var serialNumberPhone = ["10","11","12","15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.isHidden = true
        stack.backgroundColor = .clear
        pickerView.delegate = self
        pickerView.dataSource  = self

        pickerView.addViewBorder(borderColor: UIColor.white.cgColor,borderWith:2, borderCornerRadius:10)
     }


 

    @IBAction func changeSerialNumber(_ sender: UIButton) {
        pickerView.isHidden = false
     }
}
