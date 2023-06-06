//
//  ExtentionFavoriteViewController.swift
//  ViperShoping
//
//  Created by Mahmoud on 20/08/2023.
//

import UIKit

extension FavoriteProductViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    // MARK: - Methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return presenter?.favoriteProduct?.count ?? 0
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = favoriteTable.dequeueReusableCell(withIdentifier:"FavoriteCell", for: indexPath) as! FavoriteCell
            cell.configure(with: presenter?.favoriteProduct?[indexPath.row])
     
            return cell
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 260
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        self.present(SubCategoryWireFrame.assembleModule(id: presenter?.favoriteProduct?[indexPath.row].id ?? 0), animated: true)
 
        }
 }
 
