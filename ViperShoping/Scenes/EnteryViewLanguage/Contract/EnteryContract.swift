//
//  EnteryContract.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/06/2024.
//

import UIKit

     protocol EntryLanguageViewProtocol :AnyObject {
// MARK: - Variables
         var presenter : EntryLanguagePresenterProtocol? {get}
     }

     protocol EntryLanguagePresenterProtocol : AnyObject{
 // MARK: - Variables
         var view : EntryLanguageViewProtocol? {get set}
         var wireframe : EntryLanguageWireFrameProtocol? {get set}
 // MARK: - Functions
          func routeToAuthViewArbic()
          func routeToAuthViewEnglish()
    }

     protocol EntryLanguageWireFrameProtocol: AnyObject {
 // MARK: - Variables
         var viewController : UIViewController?{get set}
 // MARK: - Functions
         static func assembleModule() -> UIViewController
         func presentAuthArbic()
         func presentAuthEnglish()
     }
