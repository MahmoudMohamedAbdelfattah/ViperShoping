//
//  ExtentionCategoryProduct.swift
//  ViperShoping
//
//  Created by Mahmoud on 18/07/2023.
//

import UIKit

extension CategoryProduct  {
    
 // MARK: - Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return presenter?.allProductCategory?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CellCategoryProduct", for: indexPath) as! CellCategoryProduct
                cell.configure(with:presenter?.allProductCategory?[indexPath.row])        
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let width = ProductCollection.frame.size.width
            let hight = ProductCollection.frame.size.height / 3
                return CGSize(width: width, height: hight)
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        self.presentToCategoryDetail(id: presenter?.allProductCategory?[indexPath.row].id ?? 0)
       }
 }
