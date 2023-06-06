//
//  TabBarPresenter.swift
//  ViperShoping
//
//  Created by Mahmoud on 19/07/2023.
//
 
import UIKit

 

class TabBarPresenter  : TabBarPresenterProtocol {
 
// MARK: - Variables
    weak var view: TabBarViewProtocol?
    var wireframe: TabBarWireFrameProtocol?
 
// MARK: - Initializers
    init(view:TabBarViewProtocol,wireframe:TabBarWireFrameProtocol){
        self.view = view
        self.wireframe = wireframe
      }
 }
 
