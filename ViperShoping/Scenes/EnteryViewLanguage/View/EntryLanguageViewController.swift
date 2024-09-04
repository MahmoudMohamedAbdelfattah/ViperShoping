//
//  EntryLanguageViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/06/2024.
//

import UIKit

class EntryLanguageViewController: UIViewController , EntryLanguageViewProtocol  {
  
// MARK: - IBOutlets
    @IBOutlet weak var lblSelectLanguage: UILabel!
    @IBOutlet weak var buttonEnglish: ButtonLayer!
    @IBOutlet weak var buttonArbice: ButtonLayer!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var imageStack: UIStackView!
    
// MARK: - Variables
      var presenter: EntryLanguagePresenterProtocol?
    
// MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

      }
 // MARK: - Acition
    @IBAction func englishButton(_ sender: UIButton) {
        presenter?.routeToAuthViewEnglish()
    }
    
    @IBAction func arbiceButton(_ sender: Any) {
         presenter?.routeToAuthViewArbic()
    }
 }

 
